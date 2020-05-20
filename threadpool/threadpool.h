#ifndef THREADPOOL_H
#define THREADPOOL_H

#include <list>
#include <cstdio>
#include <exception>
#include <pthread.h>
#include "../lock/locker.h"
#include "../CGImysql/sql_connection_pool.h"

template <typename T>
class threadpool//线程池
{
public:
    //connPool数据库连接池指针 thread_number是线程池中线程的数量
    //max_request是请求队列中最多允许的/等待处理的请求的数量
    threadpool(connection_pool *connPool, int thread_number = 8, int max_request = 10000);
    ~threadpool();
    bool append(T *request);//向请求队列中插入任务请求

private:
    /*工作线程运行的函数，它不断从工作队列中取出任务并执行之*/
    static void *worker(void *arg);//静态成员没有this指针
    void run();

private:
    int m_thread_number;        //线程池中的线程数
    int m_max_requests;         //请求队列中允许的最大请求数
    pthread_t *m_threads;       //描述线程池的数组，其大小为m_thread_number
    std::list<T *> m_workqueue; //请求队列
    locker m_queuelocker;       //保护请求队列的互斥锁
    sem m_queuestat;            //是否有任务需要处理
    connection_pool *m_connPool;  //数据库
};
template <typename T>
threadpool<T>::threadpool( connection_pool *connPool, int thread_number, int max_requests) : m_thread_number(thread_number), m_max_requests(max_requests), m_threads(NULL),m_connPool(connPool)
{//构造函数
    if (thread_number <= 0 || max_requests <= 0)
        throw std::exception();
    m_threads = new pthread_t[m_thread_number];//线程id初始化
    if (!m_threads)
        throw std::exception();
    for (int i = 0; i < thread_number; ++i)//循环创建线程
    { //pthread_create(指向线程标识符的指针,设置线程属性,线程运行函数的地址,运行函数的参数)
        if (pthread_create(m_threads + i, NULL, worker, this) != 0)
        {
            delete[] m_threads;
            throw std::exception();
        }
        if (pthread_detach(m_threads[i]))
        {//pthread_detach(threadid)使ID为threadid的线程处于分离状态 调用成功返回0
//一旦线程处于分离状态 线程终止时底层资源立即被回收 否则子线程会一直占用系统资源直到主线程调用pthread_join()
            delete[] m_threads;
            throw std::exception();
        }
    }
}
template <typename T>
threadpool<T>::~threadpool()
{
    delete[] m_threads;
}
template <typename T>
bool threadpool<T>::append(T *request)
{//向请求队列中添加任务
    m_queuelocker.lock();//初始化互斥锁
    if (m_workqueue.size() >= m_max_requests)
    {//队列的数量超过最大值
        m_queuelocker.unlock();
        return false;
    }
    //添加任务
    m_workqueue.push_back(request);
    m_queuelocker.unlock();
    m_queuestat.post();//给信号量+1 提醒有任务处理
    return true;
}
template <typename T>
void *threadpool<T>::worker(void *arg)//线程处理函数 指针函数 返回值是指针
{
    threadpool *pool = (threadpool *)arg;
    //将参数强制转换为线程池类 调用成员方法run();
    pool->run();
    return pool;//返回值是指针
}
template <typename T>
void threadpool<T>::run()
{//run执行任务 工作线程从请求队列中取出某个任务进行处理
    while (true)
    {
        m_queuestat.wait();//信号量等待
        m_queuelocker.lock();//唤醒后先加互斥锁
        if (m_workqueue.empty())
        {
            m_queuelocker.unlock();
            continue;
        }
        T *request = m_workqueue.front();//从队列中取出第一个任务
        m_workqueue.pop_front();//删除第一个
        m_queuelocker.unlock();
        if (!request)
            continue;

        connectionRAII mysqlcon(&request->mysql, m_connPool);
        
        request->process();
    }
}
#endif

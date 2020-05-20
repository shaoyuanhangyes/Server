#ifndef LOCKER_H
#define LOCKER_H

#include <exception>
#include <pthread.h>
#include <semaphore.h>

class sem{//信号量
public:
    sem(){
        if (sem_init(&m_sem, 0, 0) != 0){//sem_init()初始化一个未命名的信号量
            throw std::exception();
        }
    }
    sem(int num){
        if (sem_init(&m_sem, 0, num) != 0){
            throw std::exception();
        }
    }
    ~sem(){
        sem_destroy(&m_sem);//sem_destroy()销毁信号量
    }
    bool wait(){
        return sem_wait(&m_sem) == 0;//pv原子操作的p 信号量-1 信号量为0时 sem_wait阻塞
    }
    bool post(){
        return sem_post(&m_sem) == 0;//pv原子操作的v 信号量+1 信号量>0时 唤醒调用sem_post的线程
    }

private:
    sem_t m_sem;//semaphore.h
};
class locker{//互斥量 or 互斥锁
public:
    locker(){
        //pthread_mutex_init()初始化互斥量
        if (pthread_mutex_init(&m_mutex, NULL) != 0){
            throw std::exception();
        }
    }
    ~locker(){
        //pthread_mutex_destroy()销毁互斥量
        pthread_mutex_destroy(&m_mutex);
    }
    bool lock(){
        //pthread_mutex_lock()以原子操作方式给互斥锁加锁
        return pthread_mutex_lock(&m_mutex) == 0;
    }
    bool unlock(){
        //pthread_mutex_unlock()以原子操作方式给互斥锁解锁
        return pthread_mutex_unlock(&m_mutex) == 0;
    }
    pthread_mutex_t *get(){//指针函数
        return &m_mutex;
    }

private:
    pthread_mutex_t m_mutex;//pthread.h
};
class cond{//条件变量
public:
    cond(){
        //pthread_cond_init()初始化条件变量
        if (pthread_cond_init(&m_cond, NULL) != 0){
            //pthread_mutex_destroy(&m_mutex);
            throw std::exception();
        }
    }
    ~cond(){
        //pthread_cond_destroy()销毁条件变量
        pthread_cond_destroy(&m_cond);
    }
    bool wait(pthread_mutex_t *m_mutex){
        int ret = 0;
        //pthread_mutex_lock(&m_mutex);
        ret = pthread_cond_wait(&m_cond, m_mutex);
        //pthread_mutex_unlock(&m_mutex);
        return ret == 0;
         //pthread_cond_wait函数用于等待目标条件变量.该函数调用时需要传入 mutex参数(加锁的互斥锁)
        // 函数执行时先把调用线程放入条件变量的请求队列,然后将互斥锁mutex解锁
        // 当函数成功返回为0时互斥锁会再次被锁上. 也就是说函数内部会有一次解锁和加锁操作
    }
    bool timewait(pthread_mutex_t *m_mutex, struct timespec t){
        int ret = 0;
        //pthread_mutex_lock(&m_mutex);
        ret = pthread_cond_timedwait(&m_cond, m_mutex, &t);//线程同步超时处理
        //pthread_cond_timedwait()在指定时间t内有信号传来 返回0 否则返回一个非0数
        //pthread_mutex_unlock(&m_mutex);
        return ret == 0;
    }
    bool signal(){
        return pthread_cond_signal(&m_cond) == 0;
        //pthread_cond_signal()唤醒pthread_cond_wait()上的进程
        //pthread_cond_signal()发送一个信号给另外一个正在处于阻塞等待状态的线程,使其脱离阻塞状态
    }
    bool broadcast(){
        return pthread_cond_broadcast(&m_cond) == 0;
        //pthread_cond_broadcast()以广播的方式唤醒所有处于阻塞状态的线程
    }

private:
    //static pthread_mutex_t m_mutex;
    pthread_cond_t m_cond;//pthread.h
};
#endif


#ifndef SERVER_TIMER_H
#define SERVER_TIMER_H


#include <time.h>
#include "../http/http_conn.h"

//连接资源结构体成员需要用到定时器类
// 需要前向声明
class util_timer;//定时器类

//连接资源
struct client_data{
    sockaddr_in address;//客户端socket地址
    int sockfd; //socket文件描述符
    util_timer *timer;//定时器
};

class util_timer{//定时器类
public:
    util_timer():prev(nullptr),next(nullptr){}
public:
    time_t expire{};//超时时间
    void (*cb_fuc)(client_data *){};//回调函数
    client_data *user_data{};//连接资源
    util_timer *prev;//前向定时器
    util_timer *next;//后继定时器
};

class sort_timer_lst{//定时器容器类
public:
    sort_timer_lst():head(nullptr),tail(nullptr){}
    ~sort_timer_lst();
    //添加定时器，内部调用私有成员add_timer
    void add_timer(util_timer *timer);
    //调整定时器，任务发生变化时，调整定时器在链表中的位置
    void adjust_timer(util_timer *timer);
    //删除定时器
    void del_timer(util_timer *timer);
    void tick();//定时任务处理函数

private:
    //私有成员，被公有成员add_timer和adjust_time调用
    //主要用于调整链表内部结点
    void add_timer(util_timer *timer, util_timer *lst_head);

    util_timer *head;//头结点
    util_timer *tail;//尾结点
};

class Utils
{
public:
    Utils() {}
    ~Utils() {}

    void init(sort_timer_lst timer_lst, int timeslot);

    //对文件描述符设置非阻塞
    int setnonblocking(int fd);

    //将内核事件表注册读事件，ET模式，选择开启EPOLLONESHOT
    void addfd(int epollfd, int fd, bool one_shot, int TRIGMode);

    //信号处理函数
    static void sig_handler(int sig);

    //设置信号函数
    void addsig(int sig, void(handler)(int), bool restart = true);

    //定时处理任务，重新定时以不断触发SIGALRM信号
    void timer_handler();

    void show_error(int connfd, const char *info);

public:
    static int *u_pipefd;
    sort_timer_lst m_timer_lst;
    static int u_epollfd;
    int m_TIMESLOT;
};

void cb_func(client_data *user_data);
#endif //SERVER_TIMER_H

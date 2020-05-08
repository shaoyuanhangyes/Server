#include "http_conn.h"
#include <map>
#include <fstream>
#include <string>
using namespace std;

//定义http响应的一些状态信息
const char *ok_200_title = "OK";
const char *error_400_title = "Bad Request";
const char *error_400_form = "Your request has bad syntax or is inherently impossible to staisfy.\n";
const char *error_403_title = "Forbidden";
const char *error_403_form = "You do not have permission to get file form this server.\n";
const char *error_404_title = "Not Found";
const char *error_404_form = "The requested file was not found on this server.\n";
const char *error_500_title = "Internal Error";
const char *error_500_form = "There was an unusual problem serving the request file.\n";

map<string,string> users;//将表中的用户名和密码放入map
int setnonblocking(int fd){//对文件描述符设置非阻塞
    int old_option = fcntl(fd, F_GETFL);
    int new_option = old_option | O_NONBLOCK; //按位或
    fcntl(fd, F_SETFL, new_option);
    return old_option;
}
void addfd(int epollfd, int fd, bool one_shot){//将内核事件表注册读事件，ET模式，选择开启EPOLLONESHOT
    epoll_event event;
    event.data.fd = fd;

#ifdef ET
    event.events = EPOLLIN | EPOLLET | EPOLLRDHUP;
#endif

#ifdef LT
    event.events = EPOLLIN | EPOLLRDHUP;
#endif

    if (one_shot)
        event.events |= EPOLLONESHOT;
    epoll_ctl(epollfd, EPOLL_CTL_ADD, fd, &event);
    setnonblocking(fd);
}
void removefd(int epollfd,int fd){//从内核时间表删除描述符
    epoll_ctl(epollfd,EPOLL_CTL_DEL,fd,0);
    close(fd);//unist.h
}
void modfd(int epollfd,int fd,int ev){//将事件重置为EPOLLONESHOT
    epoll_event event;
    event.data.fd=fd;
#ifdef ET
    event.events = ev | EPOLLET | EPOLLONESHOT | EPOLLRDHUP;
#endif

#ifdef LT
    event.events = ev | EPOLLONESHOT | EPOLLRDHUP;
#endif

    epoll_ctl(epollfd, EPOLL_CTL_MOD, fd, &event);
}
int http_conn::m_user_count=0;
int http_conn::m_epollfd=-1;//static member

void http_conn::close_conn(bool real_close) {//关闭连接，关闭一个连接，客户总量减一
    if(real_close&&(m_sockfd!=-1)){
        removefd(m_epollfd,m_sockfd);
        m_sockfd=-1;
        m_user_count--;
    }
}

//初始化连接,外部调用初始化套接字地址
void http_conn::init(int sockfd, const sockaddr_in &addr) {
    m_sockfd=sockfd;
    m_address=addr;
    addfd(m_epollfd,sockfd,true);
    m_user_count++;
    init();
}

//初始化新接受的连接
//check_state默认为分析请求行状态
void http_conn::init(){
    mysql = NULL;
    bytes_to_send = 0;
    bytes_have_send = 0;
    m_check_state = CHECK_STATE_REQUESTLINE;
    m_linger = false;
    m_method = GET;
    m_url = 0;
    m_version = 0;
    m_content_length = 0;
    m_host = 0;
    m_start_line = 0;
    m_checked_idx = 0;
    m_read_idx = 0;
    m_write_idx = 0;
    cgi = 0;
    memset(m_read_buf,'\0',READ_BUFFER_SIZE);//string 请求报文数据数组置零
    memset(m_write_buf, '\0', WRITE_BUFFER_SIZE);
    memset(m_real_file, '\0', FILENAME_LEN);
}
//循环读取客户数据，直到无数据可读或对方关闭连接
bool http_conn::read_once() {
    if(m_read_idx>=READ_BUFFER_SIZE) return false;
    int bytes_read=0;

}

//从状态机，用于分析出一行内容
//返回值为行的读取状态，有LINE_OK,LINE_BAD,LINE_OPEN
//m_read_idx指向缓冲区m_read_buf的数据末尾的下一个字节
//m_checked_idx指向从状态机当前正在分析的字节
//HTTP报文中，每一行的数据由\r\n作为结束字符，空行则是仅仅是字符\r\n
http_conn::LINE_STATUS http_conn::parse_line() {
    char temp;
    for(;m_checked_idx<m_read_idx;++m_checked_idx){
        temp=m_read_buf[m_checked_idx];//temp为将要分析的字节
        if(temp=='\r'){
            //下一个字符达到了buffer结尾，则接收不完整，需要继续接收
            if((m_checked_idx+1)==m_read_idx) return LINE_OPEN;
            else if(m_read_buf[m_checked_idx+1]=='\n'){
                m_read_buf[m_checked_idx++]='\0';// \0=\r
                m_read_buf[m_checked_idx++]='\0';// \0=\n
                return LINE_OK;//Recieved successful
            }
            return LINE_BAD;//error
        }
        //如果当前字符是\n，也有可能读取到完整行
//一般是上次读取到\r就到buffer末尾了，没有接收完整，再次接收时会出现这种情况
        else if(temp=='\n'){
            if(m_checked_idx>1&&m_read_buf[m_checked_idx-1]=='\r'){
                m_read_buf[m_checked_idx-1]='\0';// \0=\r
                m_read_buf[m_checked_idx++]='\0';// \0=\n
                return LINE_OK;//Recieved successful
            }
            return LINE_BAD;
        }
    }
    return LINE_OPEN;//并没有找到\r\n，需要继续接收
}




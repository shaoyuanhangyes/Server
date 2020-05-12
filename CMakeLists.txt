cmake_minimum_required(VERSION 3.16)
project(Server)

set(CMAKE_CXX_STANDARD 20)

add_executable(Server main.cpp lock/lock.h threadpool/threadpool.h http/http_conn.h http/http_conn.cpp timer/timer.h timer/timer.cpp CGImysql/sql_connection_pool.h CGImysql/sql_connection_pool.cpp CGImysql/sign.cpp log/log.h log/block_queue.h log/log.cpp WebServer/webserver.h WebServer/webserver.cpp config/config.h config/config.cpp)
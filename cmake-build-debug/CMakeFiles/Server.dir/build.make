# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/syh/下载/clion-2020.1.1/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/syh/下载/clion-2020.1.1/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/syh/CLionProjects/Server

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/syh/CLionProjects/Server/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Server.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Server.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Server.dir/flags.make

CMakeFiles/Server.dir/main.cpp.o: CMakeFiles/Server.dir/flags.make
CMakeFiles/Server.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/syh/CLionProjects/Server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Server.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Server.dir/main.cpp.o -c /home/syh/CLionProjects/Server/main.cpp

CMakeFiles/Server.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/syh/CLionProjects/Server/main.cpp > CMakeFiles/Server.dir/main.cpp.i

CMakeFiles/Server.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/syh/CLionProjects/Server/main.cpp -o CMakeFiles/Server.dir/main.cpp.s

CMakeFiles/Server.dir/http/http_conn.cpp.o: CMakeFiles/Server.dir/flags.make
CMakeFiles/Server.dir/http/http_conn.cpp.o: ../http/http_conn.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/syh/CLionProjects/Server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/Server.dir/http/http_conn.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Server.dir/http/http_conn.cpp.o -c /home/syh/CLionProjects/Server/http/http_conn.cpp

CMakeFiles/Server.dir/http/http_conn.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server.dir/http/http_conn.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/syh/CLionProjects/Server/http/http_conn.cpp > CMakeFiles/Server.dir/http/http_conn.cpp.i

CMakeFiles/Server.dir/http/http_conn.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server.dir/http/http_conn.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/syh/CLionProjects/Server/http/http_conn.cpp -o CMakeFiles/Server.dir/http/http_conn.cpp.s

CMakeFiles/Server.dir/timer/timer.cpp.o: CMakeFiles/Server.dir/flags.make
CMakeFiles/Server.dir/timer/timer.cpp.o: ../timer/timer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/syh/CLionProjects/Server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/Server.dir/timer/timer.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Server.dir/timer/timer.cpp.o -c /home/syh/CLionProjects/Server/timer/timer.cpp

CMakeFiles/Server.dir/timer/timer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server.dir/timer/timer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/syh/CLionProjects/Server/timer/timer.cpp > CMakeFiles/Server.dir/timer/timer.cpp.i

CMakeFiles/Server.dir/timer/timer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server.dir/timer/timer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/syh/CLionProjects/Server/timer/timer.cpp -o CMakeFiles/Server.dir/timer/timer.cpp.s

CMakeFiles/Server.dir/CGImysql/sql_connection_pool.cpp.o: CMakeFiles/Server.dir/flags.make
CMakeFiles/Server.dir/CGImysql/sql_connection_pool.cpp.o: ../CGImysql/sql_connection_pool.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/syh/CLionProjects/Server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/Server.dir/CGImysql/sql_connection_pool.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Server.dir/CGImysql/sql_connection_pool.cpp.o -c /home/syh/CLionProjects/Server/CGImysql/sql_connection_pool.cpp

CMakeFiles/Server.dir/CGImysql/sql_connection_pool.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server.dir/CGImysql/sql_connection_pool.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/syh/CLionProjects/Server/CGImysql/sql_connection_pool.cpp > CMakeFiles/Server.dir/CGImysql/sql_connection_pool.cpp.i

CMakeFiles/Server.dir/CGImysql/sql_connection_pool.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server.dir/CGImysql/sql_connection_pool.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/syh/CLionProjects/Server/CGImysql/sql_connection_pool.cpp -o CMakeFiles/Server.dir/CGImysql/sql_connection_pool.cpp.s

CMakeFiles/Server.dir/CGImysql/sign.cpp.o: CMakeFiles/Server.dir/flags.make
CMakeFiles/Server.dir/CGImysql/sign.cpp.o: ../CGImysql/sign.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/syh/CLionProjects/Server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/Server.dir/CGImysql/sign.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Server.dir/CGImysql/sign.cpp.o -c /home/syh/CLionProjects/Server/CGImysql/sign.cpp

CMakeFiles/Server.dir/CGImysql/sign.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server.dir/CGImysql/sign.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/syh/CLionProjects/Server/CGImysql/sign.cpp > CMakeFiles/Server.dir/CGImysql/sign.cpp.i

CMakeFiles/Server.dir/CGImysql/sign.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server.dir/CGImysql/sign.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/syh/CLionProjects/Server/CGImysql/sign.cpp -o CMakeFiles/Server.dir/CGImysql/sign.cpp.s

CMakeFiles/Server.dir/log/log.cpp.o: CMakeFiles/Server.dir/flags.make
CMakeFiles/Server.dir/log/log.cpp.o: ../log/log.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/syh/CLionProjects/Server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/Server.dir/log/log.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Server.dir/log/log.cpp.o -c /home/syh/CLionProjects/Server/log/log.cpp

CMakeFiles/Server.dir/log/log.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server.dir/log/log.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/syh/CLionProjects/Server/log/log.cpp > CMakeFiles/Server.dir/log/log.cpp.i

CMakeFiles/Server.dir/log/log.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server.dir/log/log.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/syh/CLionProjects/Server/log/log.cpp -o CMakeFiles/Server.dir/log/log.cpp.s

CMakeFiles/Server.dir/WebServer/webserver.cpp.o: CMakeFiles/Server.dir/flags.make
CMakeFiles/Server.dir/WebServer/webserver.cpp.o: ../WebServer/webserver.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/syh/CLionProjects/Server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/Server.dir/WebServer/webserver.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Server.dir/WebServer/webserver.cpp.o -c /home/syh/CLionProjects/Server/WebServer/webserver.cpp

CMakeFiles/Server.dir/WebServer/webserver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server.dir/WebServer/webserver.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/syh/CLionProjects/Server/WebServer/webserver.cpp > CMakeFiles/Server.dir/WebServer/webserver.cpp.i

CMakeFiles/Server.dir/WebServer/webserver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server.dir/WebServer/webserver.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/syh/CLionProjects/Server/WebServer/webserver.cpp -o CMakeFiles/Server.dir/WebServer/webserver.cpp.s

CMakeFiles/Server.dir/config/config.cpp.o: CMakeFiles/Server.dir/flags.make
CMakeFiles/Server.dir/config/config.cpp.o: ../config/config.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/syh/CLionProjects/Server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/Server.dir/config/config.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Server.dir/config/config.cpp.o -c /home/syh/CLionProjects/Server/config/config.cpp

CMakeFiles/Server.dir/config/config.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Server.dir/config/config.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/syh/CLionProjects/Server/config/config.cpp > CMakeFiles/Server.dir/config/config.cpp.i

CMakeFiles/Server.dir/config/config.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Server.dir/config/config.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/syh/CLionProjects/Server/config/config.cpp -o CMakeFiles/Server.dir/config/config.cpp.s

# Object files for target Server
Server_OBJECTS = \
"CMakeFiles/Server.dir/main.cpp.o" \
"CMakeFiles/Server.dir/http/http_conn.cpp.o" \
"CMakeFiles/Server.dir/timer/timer.cpp.o" \
"CMakeFiles/Server.dir/CGImysql/sql_connection_pool.cpp.o" \
"CMakeFiles/Server.dir/CGImysql/sign.cpp.o" \
"CMakeFiles/Server.dir/log/log.cpp.o" \
"CMakeFiles/Server.dir/WebServer/webserver.cpp.o" \
"CMakeFiles/Server.dir/config/config.cpp.o"

# External object files for target Server
Server_EXTERNAL_OBJECTS =

Server: CMakeFiles/Server.dir/main.cpp.o
Server: CMakeFiles/Server.dir/http/http_conn.cpp.o
Server: CMakeFiles/Server.dir/timer/timer.cpp.o
Server: CMakeFiles/Server.dir/CGImysql/sql_connection_pool.cpp.o
Server: CMakeFiles/Server.dir/CGImysql/sign.cpp.o
Server: CMakeFiles/Server.dir/log/log.cpp.o
Server: CMakeFiles/Server.dir/WebServer/webserver.cpp.o
Server: CMakeFiles/Server.dir/config/config.cpp.o
Server: CMakeFiles/Server.dir/build.make
Server: CMakeFiles/Server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/syh/CLionProjects/Server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX executable Server"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Server.dir/build: Server

.PHONY : CMakeFiles/Server.dir/build

CMakeFiles/Server.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Server.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Server.dir/clean

CMakeFiles/Server.dir/depend:
	cd /home/syh/CLionProjects/Server/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/syh/CLionProjects/Server /home/syh/CLionProjects/Server /home/syh/CLionProjects/Server/cmake-build-debug /home/syh/CLionProjects/Server/cmake-build-debug /home/syh/CLionProjects/Server/cmake-build-debug/CMakeFiles/Server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Server.dir/depend


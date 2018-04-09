cmake_minimum_required(VERSION 3.8)
project(gnrparaleloopenmp)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${GTK_CFLAGS} -fopenmp")

set(SOURCE_FILES main.cpp)
add_executable(gnrparaleloopenmp ${SOURCE_FILES})
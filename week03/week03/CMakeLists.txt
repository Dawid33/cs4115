cmake_minimum_required(VERSION 3.1)
project(test)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)

add_executable(test matmult.cc)

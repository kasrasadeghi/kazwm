cmake_minimum_required(VERSION 3.12)

set(PROJECT_NAME "kazwm")
set(PROJECT_ROOT ${CMAKE_CURRENT_LIST_DIR})

project(${PROJECT_NAME})

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wfatal-errors -O3")

add_subdirectory(lib)

if (GTEST)
  add_subdirectory(test)
else (GTEST)
  add_subdirectory(app)
endif (GTEST)

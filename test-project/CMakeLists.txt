cmake_minimum_required(VERSION 3.26)

project("test-project")

option(WITH_FIX "Build with fix" OFF)

set(CMAKE_CXX_STANDARD 17)

if(WITH_FIX)
  list(APPEND CMAKE_PREFIX_PATH "${CMAKE_CURRENT_LIST_DIR}/../install-with-fix")
else()
  list(APPEND CMAKE_PREFIX_PATH "${CMAKE_CURRENT_LIST_DIR}/../install")
endif()

find_package(antlr4-runtime REQUIRED)

get_target_property(antlr4_static_RUNTIME_INTERFACE_INCLUDES antlr4_static INTERFACE_INCLUDE_DIRECTORIES)
message("antlr4_static_RUNTIME_INTERFACE_INCLUDES is [${antlr4_static_RUNTIME_INTERFACE_INCLUDES}]")

get_target_property(antlr4_shared_RUNTIME_INTERFACE_INCLUDES antlr4_shared INTERFACE_INCLUDE_DIRECTORIES)
message("antlr4_shared_RUNTIME_INTERFACE_INCLUDES is [${antlr4_shared_RUNTIME_INTERFACE_INCLUDES}]")

add_executable(test-static main.cpp)
target_link_libraries(test-static  PRIVATE antlr4_static)

add_executable(test-shared main.cpp)
target_link_libraries(test-shared PRIVATE antlr4_shared)
set_property(TARGET test-shared PROPERTY
  MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
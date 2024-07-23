cmake_minimum_required(VERSION 3.26)

project("test-project")

set(CMAKE_CXX_STANDARD 17)

list(APPEND CMAKE_PREFIX_PATH "${CMAKE_CURRENT_LIST_DIR}/../install")

find_package(antlr4-runtime REQUIRED)

get_target_property(ANTLR4_RUNTIME_INTERFACE_INCLUDES antlr4_static INTERFACE_INCLUDE_DIRECTORIES)
message("ANTLR4_RUNTIME_INTERFACE_INCLUDES is [${ANTLR4_RUNTIME_INTERFACE_INCLUDES}]")

add_executable(test main.cpp)
target_link_libraries(test PRIVATE antlr4_static)

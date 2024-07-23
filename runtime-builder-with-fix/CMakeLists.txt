cmake_minimum_required(VERSION 3.26)

project("runtime-builder")

set(CMAKE_CXX_STANDARD 17)

set(ANTLR_BUILD_CPP_TESTS OFF)
set(ANTLR4_INSTALL ON)

set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_LIST_DIR}/../install-with-fix")

include(FetchContent)

FetchContent_Declare(
  antlr
  GIT_REPOSITORY https://github.com/njnobles/antlr4.git
  GIT_TAG        1aae37de4145814c254d666816c12e3a059426f6
  SOURCE_SUBDIR runtime/Cpp
)

FetchContent_MakeAvailable(antlr)

set(config_suffix "")
set(debug_suffix "-debug")

if (TARGET antlr4_shared)
  set_target_properties(antlr4_shared
                        PROPERTIES OUTPUT_NAME_RELEASE "antlr4-runtime${config_suffix}"
                                   OUTPUT_NAME_DEBUG "antlr4-runtime${config_suffix}${debug_suffix}"
  )
endif()

if (TARGET antlr4_static)
  set_target_properties(antlr4_static
                        PROPERTIES OUTPUT_NAME_RELEASE "antlr4-runtime${static_lib_suffix}"
                                   OUTPUT_NAME_DEBUG "antlr4-runtime${static_lib_suffix}${debug_suffix}"
                                   COMPILE_PDB_NAME_RELEASE "antlr4-runtime${static_lib_suffix}"
                                   COMPILE_PDB_NAME_DEBUG "antlr4-runtime${static_lib_suffix}${debug_suffix}"
  )
endif()


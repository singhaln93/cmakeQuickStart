cmake_minimum_required(VERSION 3.22)
project(test)

#add_library(${PROJECT_NAME} main.cpp)

file(GLOB files test/*.cpp)

foreach(file ${files})
    get_filename_component(file_basename ${file} NAME_WE)
    string(REGEX REPLACE "unit-([^$]+)" "test-\\1" testcase ${file_basename})
    add_executable(${testcase})

    add_test(NAME "${testcase}" COMMAND ${testcase} ${DOCTEST_TEST_FILTER} 
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})
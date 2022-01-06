# Copyright © 2021  Neeraj Singhal
# All rights reserved

#!/bin/bash
### START ###
cd ..
CMAKE_VERSION=$(cmake --version)
GCC_VERSION=$(gcc --version)
echo -e $CMAKE_VERSION
echo -e $GCC_VERSION
mkdir -p build && cd build &&
    CXX=g++ CC=gcc
    cmake -DCMAKE_BUILD_TYPE=Debug .. &&    #-DOPTION=ON(value) set submodule options 
    make -j4                                # make VERBOSE= 1 for detailed log
    
#clear
# echo -e "\nTest Results..."
# make test
# ctest
#./tests
echo -e "\nOutput..."
./CMakeProject
### END ###

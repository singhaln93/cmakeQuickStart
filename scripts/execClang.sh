# Copyright © 2021  Neeraj Singhal
# All rights reserved

#!/bin/bash
### START ###
cd ..
CMAKE_VERSION=$(cmake --version)
CLANG_VERSION=$(clang --version)
echo -e $CMAKE_VERSION
echo -e $CLANG_VERSION
mkdir -p build.clang && cd build.clang &&
    CXX=clang++ CC=clang
cmake -DCMAKE_BUILD_TYPE=Debug .. && #-DOPTION=ON(value) set submodule options
    make -j4                         # make VERBOSE= 1 for detailed log
#clear
echo -e "\nTest Results..."
./tests
echo -e "\nOutput..."
./CMakeProject
### END ###

# Copyright © 2021  Neeraj Singhal
# All rights reserved

#!/bin/bash
NINJA_SUPPORTED=$(cmake --help | grep Ninja)
NINJA_VERSION=$(ninja --version)

if [ -z "$NINJA_SUPPORTED" ]; then
    echo "Ninja not supported"
    exit
else
    echo -e "Ninja:" $NINJA_VERSION
fi


### START ###
cd ..
mkdir -p build.ninja && cd build.ninja &&
    cmake -DCMAKE_BUILD_TYPE=Debug .. -G Ninja && 
    ninja
#clear
#echo -e "\nTest Results..."
#./tests
echo -e "\nOutput..."
./CMakeProject
### END ###

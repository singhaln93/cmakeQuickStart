# Copyright © 2021  Neeraj Singhal
# All rights reserved

#!/bin/bash
### START ###
cd ..
make clean -C /build.gcc/
rm -rf build.gcc
make clean -C /build.clang/
rm -rf build.clang
make clean -C /build.ninja/
rm -rf build.ninja
clear
echo "Cleaning build directories..."
### END ###

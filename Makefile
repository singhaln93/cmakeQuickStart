PROJECT_NAME=CMakeProject
BUILD_DIR=.build
SOURCES=main.cpp

# Compile main by default
all: test_gcc

help:
	@echo Whatever help info you want here, eg
	@echo '  make test_gcc'
	@echo '  make test_clang'
	@echo '  make test_cross'
	@echo '  make test_bazel'
	@echo '  make test_meson'
	@echo '  make test_conan'
#	@echo '  make clang-tidy'
	@echo '  make format'
#	@echo '  make documentation'
	@echo '  make coverage'
	@echo '  make clean-bazel'
	@echo '  make clean'
	@echo ''

test_gcc:
	mkdir -p $(BUILD_DIR) && cd $(BUILD_DIR) \
	&& cmake -G "Unix Makefiles" -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ ..\
	&& make -j4 && ./$(PROJECT_NAME)

test_clang:
	mkdir -p $(BUILD_DIR) && cd $(BUILD_DIR) \
	&& cmake -G "Unix Makefiles" -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ .. \
	&& make -j4 && ./$(PROJECT_NAME)

#TODO: add cross-compiling toolchain in the project (Later)
test_cross:
	mkdir -p $(BUILD_DIR) && cd $(BUILD_DIR) \
	&& cmake -G "Unix Makefiles" -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ .. \
	&& make -j4 && ./$(PROJECT_NAME)

test_bazel:	
	bazel build //:$(PROJECT_NAME) && ./bazel-bin/$(PROJECT_NAME)

test_meson:
	meson setup $(BUILD_DIR) && cd $(BUILD_DIR) && meson compile && ./$(PROJECT_NAME)

test_conan:
	mkdir -p $(BUILD_DIR) && cd $(BUILD_DIR) && conan install .. && cmake .. && make -j4 \
	&& ./bin/$(PROJECT_NAME)

#!FIX: update clang-tidy checks
clang-tidy:
	/usr/bin/clang-tidy --use-color main.cpp

format:
	/usr/bin/clang-format -i $(SOURCES)

#documentation:
#doxygen misc/Doxygen/doxyfile.conf

coverage:
	mkdir -p ${BUILD_DIR} && cd $(BUILD_DIR) && cmake -DCMAKE_BUILD_TYPE=Debug .. &&\
	cmake --build . -t coverage

clean_bazel:
	bazel clean

clean:
	rm -rf $(BUILD_DIR) BUILD_DIR BUILD_DIR.*

# These rules do not correspond to a specific file
.PHONY: clean format

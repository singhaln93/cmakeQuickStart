# Download all the Submodules
find_package(Git QUIET)
if(GIT_FOUND AND EXISTS "${PROJECT_SOURCE_DIR}/.git")
    # Update submodule as needed 
    option(GIT_SUBMODULE "Check submodules during build" ON)
    if(GIT_SUBMODULE)
        message(STATUS "Submodule update.. - done")
        execute_process(COMMAND ${GIT_EXECUTABLE} submodule update --init --recursive
                        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                        RESULT_VARIABLE GIT_SUBMOD_RESULT)
        if(NOT GIT_SUBMOD_RESULT EQUAL "0")
            message(FATAL_ERROR "git submodule update --init failed with\
                    ${GIT_SUBMOD_RESULT}.Please check for the submodule")
        endif()
    endif()
endif()

# Check all the Submodules- checks for CMakeLists.txt 
# for <sub> submodule- json (nlohmann json)
if(NOT EXISTS "${PROJECT_SOURCE_DIR}/dep/json/CMakeLists.txt")
    message(FATAL_ERROR "The json submodules was not downloaded! GIT_SUBMODULE was turned\
            off or failed.Please check for dep/json/CMakeLists.txt")
endif()
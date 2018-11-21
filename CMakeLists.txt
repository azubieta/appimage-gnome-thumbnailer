cmake_minimum_required(VERSION 3.2)
cmake_policy(SET CMP0048 NEW) # Allow version field in the project command

project(appimage-gnome-thumbnailer VERSION 0.1.1)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED On)

find_package(libappimage QUIET)
if(NOT TARGET libappimage)
    include(cmake/libappimage_as_external_project.cmake)
    set(LIBAPPIMAGE_INCLUDED On GLOBAL)
endif()

add_subdirectory(src)
add_subdirectory(res)

include(cmake/cpack_generic.cmake)
include(cmake/cpack_debian.cmake)
include(cmake/cpack_rpm.cmake)
include(CPack)


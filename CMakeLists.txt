project(appimage-gnome-thumbnailer)
cmake_minimum_required(VERSION 3.2)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED On)

find_package(libappimage QUIET)
if(NOT TARGET libappimage)
    include(cmake/libappimage_as_external_project.cmake)
    set(LIBAPPIMAGE_INCLUDED On GLOBAL)
endif()

add_subdirectory(src)
add_subdirectory(res)

include(cmake/cpack_debian.cmake)


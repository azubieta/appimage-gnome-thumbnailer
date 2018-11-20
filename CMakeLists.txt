project(appimage-gnome-thumbnailer)
cmake_minimum_required(VERSION 3.2)

find_package(libappimage QUIET)
if(NOT TARGET libappimage)
    include(cmake/libappimage_as_external_project.cmake)
endif()

add_subdirectory(src)
add_subdirectory(res)

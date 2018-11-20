# required for DEB-DEFAULT to work as intended
cmake_minimum_required(VERSION 3.6)

set(CPACK_GENERATOR "DEB")

set(CPACK_DEBIAN_PACKAGE_VERSION ${PROJECT_VERSION})

# determine Git commit ID
execute_process(
    COMMAND git rev-parse --short HEAD
    WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
    OUTPUT_VARIABLE GIT_COMMIT
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

message("GIT_COMMIT: ${GIT_COMMIT}")
set(CPACK_DEBIAN_PACKAGE_RELEASE "git${GIT_COMMIT}")

if(DEFINED ENV{ARCH})
    set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE $ENV{ARCH})
    if(CPACK_DEBIAN_PACKAGE_ARCHITECTURE MATCHES "i686")
        set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "i386")
    endif()
endif()

message("CPACK_DEBIAN_PACKAGE_ARCHITECTURE: ${CPACK_DEBIAN_PACKAGE_ARCHITECTURE}")

set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Alexis Lopez Zubieta")
set(CPACK_DEBIAN_PACKAGE_HOMEPAGE "https://github.com/azubieta/appimage-gnome-thumbnailer")
set(CPACK_PACKAGE_DESCRIPTION_FILE "${CMAKE_SOURCE_DIR}/README.md")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/LICENSE")
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_DEBIAN_PACKAGE_SECTION Utilities)
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "AppImage Thumbnailer for Gnome")
set(CPACK_PACKAGE_DESCRIPTION " AppImage Thumbnailer for Gnome")

if(LIBAPPIMAGE_INCLUDED)
    set(CPACK_DEBIAN_PACKAGE_DEPENDS "libglib2.0-0, libgdk-pixbuf2.0-0")
else()
    set(CPACK_DEBIAN_PACKAGE_DEPENDS "libappimage, libglib2.0, libgdk-pixbuf2.0-0")
endif()

include(CPack)
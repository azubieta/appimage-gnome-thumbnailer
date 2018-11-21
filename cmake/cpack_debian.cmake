# required for DEB-DEFAULT to work as intended
cmake_minimum_required(VERSION 3.6)

set(CPACK_GENERATOR "DEB")

set(CPACK_DEBIAN_PACKAGE_SECTION Utilities)

if(LIBAPPIMAGE_INCLUDED)
    set(CPACK_DEBIAN_PACKAGE_DEPENDS "libglib2.0-0, libgdk-pixbuf2.0-0")
else()
    set(CPACK_DEBIAN_PACKAGE_DEPENDS "libappimage, libglib2.0, libgdk-pixbuf2.0-0")
endif()



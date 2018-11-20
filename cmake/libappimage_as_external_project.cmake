include(ExternalProject)

externalproject_add(libappimage_as_external_project
    GIT_REPOSITORY https://github.com/AppImage/libappimage.git
    GIT_TAG "master"
    GIT_SHALLOW On

    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/3rdparty/libappimage
    CONFIGURE_COMMAND ${CMAKE_COMMAND} -G${CMAKE_GENERATOR} -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} <SOURCE_DIR>
    INSTALL_COMMAND make install DESTDIR=${CMAKE_CURRENT_BINARY_DIR}/3rdparty/libappimage
    )


ExternalProject_Get_Property(libappimage_as_external_project install_dir)
add_library(libappimage SHARED IMPORTED)

set_target_properties(libappimage PROPERTIES
    IMPORTED_LOCATION ${install_dir}/lib/libappimage.so
    INTERFACE_INCLUDE_DIRECTORIES ${install_dir}/include
    )



add_dependencies(libappimage libappimage_as_external_project)

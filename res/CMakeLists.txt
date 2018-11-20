configure_file(appimage-gnome.thumbnailer.in ${PROJECT_BINARY_DIR}/appimage-gnome.thumbnailer)

install(FILES ${PROJECT_BINARY_DIR}/appimage-gnome.thumbnailer DESTINATION ${CMAKE_INSTALL_PREFIX}/share/thumbnailers)

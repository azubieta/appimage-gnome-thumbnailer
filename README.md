appimage-gnome-thumbnailer
==========================

Generate AppImage files thumbnails for the Gnome desktop environment. 
Latest `shared-mime-info` package is required for proper AppImage file
mime-type association. 

Downloads are available at the "downloads" tab.

###Requirements
- gcc
- gtk-2.0
- cmake
- libappimage (optional)
- desktop-file-utils (if no libappimage)
- libfuse-dev (if no libappimage)

###Building 
 - git clone https://github.com/azubieta/appimage-gnome-thumbnailer.git
 - cd appimage-gnome-thumbnailer
 - cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr
 - make
 - sudo make install

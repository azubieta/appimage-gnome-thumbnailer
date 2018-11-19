project(appimage-gnome-thumbnailer)
cmake_minimum_required(VERSION 3.2)

find_package (PkgConfig REQUIRED)
pkg_check_modules (GLIB2 REQUIRED glib-2.0)
pkg_check_modules (GDK REQUIRED gdk-pixbuf-2.0)
pkg_check_modules (GIO REQUIRED gio-2.0)


add_executable(appimage-gnome-thumbnailer
    src/gnome-thumbnailer-skeleton.c
    src/gnome-thumbnailer-skeleton.h
    src/appimage-gnome-thumbnailer.c)

target_include_directories(appimage-gnome-thumbnailer PRIVATE ${GLIB2_INCLUDE_DIRS} ${GDK_INCLUDE_DIRS} ${GIO_INCLUDE_DIRS})
target_link_libraries(appimage-gnome-thumbnailer ${GIO_LIBRARIES} ${GDK_LIBRARIES}  ${GLIB2_LIBRARIES} m)
target_compile_definitions(appimage-gnome-thumbnailer PRIVATE
    THUMBNAILER_RETURNS_PIXBUF
    THUMBNAILER_USAGE="Thumbnail AppImage files"
)

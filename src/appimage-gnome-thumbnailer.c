#include "gnome-thumbnailer-skeleton.h"

#include <appimage/appimage.h>

#define LIBAPPIMAGE_ERROR libappimage_error_quark ()

GQuark libappimage_error_quark(void) {
    return g_quark_from_static_string("libappimage-error-quark");
}

char* file_to_data(const char* path,
                   gsize* ret_length,
                   GError** error) {

    if (appimage_get_type(path, false) == -1) {
        *ret_length = 0;
        *error = g_error_new_literal(LIBAPPIMAGE_ERROR, 1, "Invalid AppImage file.");
        return NULL;
    }

    char* data = NULL;
    gsize data_size = 0;

    if (appimage_read_file_into_buffer_following_symlinks(path, ".DirIcon", &data, &data_size)) {
        *ret_length = data_size;
        *error = NULL;
        return data;
    } else {
        *ret_length = 0;
        *error = g_error_new_literal(LIBAPPIMAGE_ERROR, 2, "Unable to read .DirIcon file.");
        return NULL;
    }

}

PKG_NAME="gtk3"
PKG_VERSION="3.22.30"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://www.gtk.org/"
PKG_URL="http://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-$PKG_VERSION.tar.xz"
PKG_SOURCE_DIR="gtk+-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain atk libX11 libXrandr libXi glib pango cairo gdk-pixbuf at-spi2-atk libepoxy"
PKG_SECTION="x11/toolkits"
PKG_SHORTDESC="gtk+: The Gimp ToolKit (GTK)"
PKG_LONGDESC="This is GTK+. GTK+, which stands for the Gimp ToolKit, is a library for creating graphical user interfaces for the X Window System. It is designed to be small, efficient, and flexible. GTK+ is written in C with a very object-oriented approach."
PKG_BUILD_FLAGS="-lto"

PKG_CONFIGURE_OPTS_TARGET="--disable-static \
                           --enable-shared \
                           --disable-glibtest \
                           --enable-modules \
                           --enable-explicit-deps=no \
                           --disable-debug \
                           --disable-cups \
                           --disable-papi \
                           --enable-xkb \
                           --disable-xinerama \
                           --disable-gtk-doc-html"

pre_configure_target() {
  LDFLAGS="$LDFLAGS -L$(get_build_dir gtk3) -L$(get_build_dir xorg-server) -L$(get_build_dir glfw)"
  LIBS="$LIBS -lXcursor"
# -lX11 -lGLEW -lGLU -lGL -lm -ldl -ldrm -lXdamage -lX11-xcb -lxcb-glx -lxcb-dri2 -lxcb-dri3 -lxcb-present -lxcb-sync -lxshmfence -lXxf86vm -lXfixes -lXext -lxcb -lXau"
}
#post_makeinstall_target() {
#  cp $PKG_DIR/files/settings.ini $INSTALL/etc/gtk-3.0/
#}

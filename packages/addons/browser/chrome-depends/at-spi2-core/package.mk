# Made by github.com/escalade

PKG_NAME="at-spi2-core"
PKG_VERSION="2.28.0"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://www.gnome.org/"
PKG_URL="http://ftp.gnome.org/pub/gnome/sources/$PKG_NAME/2.28/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain dbus glib libXtst"
PKG_SECTION="escalade/depends"
PKG_SHORTDESC="Protocol definitions and daemon for D-Bus at-spi"

PKG_CONFIGURE_OPTS_TARGET="--disable-static \
                           --enable-shared"
                           
pre_configure_target() {
  LDFLAGS="$LDFLAGS -lXext"
}


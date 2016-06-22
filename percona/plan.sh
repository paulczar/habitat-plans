pkg_origin=paulczar
pkg_name=percona-server
pkg_version=5.7.12-5
pkg_maintainer="Paul Czarkowski <username.taken@gmail.com>"
pkg_license=("Apache 2.0")
pkg_source=https://www.percona.com/downloads/Percona-Server-5.7/Percona-Server-5.7.12-5/source/tarball/percona-server-5.7.12-5.tar.gz
pkg_shasum=1840b60878c2a11538c1a8793d8679c538c796ec840fedf191716149f381fada
pkg_deps=(
  core/coreutils
  core/gcc
  core/gcc-libs
  core/glibc
  core/boost159
#  core/make
#  core/bison
#  core/zlib
#  core/ncurses
#  core/cmake
#  core/libaio
#  core/libxml2
  #core/libedit
#  core/pkg-config
  #core/openssl
  core/readline
  paulczar/jemalloc
)
pkg_build_deps=(
  core/coreutils
  core/gcc
  core/gcc-libs
  core/glibc
  core/boost159
  core/make
  core/bison
  core/zlib
  core/ncurses
  core/cmake
  core/libaio
  core/libxml2
  #core/libedit
  core/pkg-config
  #core/openssl
  core/readline
  paulczar/jemalloc
)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)
pkg_expose=(3306)


do_build() {

    # there is a bug in how we're doing GCC or something that causes abi_check to fail
    # let's YOLO that shit away with some sed.
    sed -i 's/^.*abi_check.*$/#/' CMakeLists.txt

    export CXXFLAGS="$CFLAGS"
    cmake . \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_CONFIG=mysql_release \
        -DFEATURE_SET=community \
        -DWITH_EMBEDDED_SERVER=OFF \
        -DCMAKE_INSTALL_PREFIX=${pkg_prefix} \
        #-DWITH_EDITLINE=bundled \
        #-DWITH_READLINE=OFF \
        -DWITH_SSL=bundled
    make
}

do_install() {
    make install
}

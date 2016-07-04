set -xeo

pkg_origin=paulczar
pkg_name=galera
pkg_version=3-25.3.16
pkg_maintainer="Paul Czarkowski <username.taken@gmail.com>"
pkg_license=("Apache 2.0")
pkg_source=http://releases.galeracluster.com/source/galera-${pkg_version}.tar.gz
pkg_shasum=e123a7c5a054e377f94c6113eb62295bb7da82b5ab03cbf9505a0903ddbf995b
# mysqld_safe
pkg_deps=(
#core/python
#  core/coreutils
#  core/gcc
#  core/gcc-libs
#  core/make
#  core/bison
#  core/zlib
#  core/ncurses
#  core/glibc
#  core/cmake
#  core/libaio
#  core/libxml2
#  core/pkg-config
#  core/m4
#  core/libbsd
#  core/libedit
#  core/texinfo
#  core/bash
#  core/openssl
#  core/openssl-musl
#  paulczar/jemalloc
)

pkg_build_deps=(
#  paulczar/scons
  core/coreutils
  core/python2
  core/cacerts
  core/curl
#  core/gcc
#  core/gcc-libs
#  core/make
#  core/bison
#  core/zlib
#  core/ncurses
#  core/glibc
#  core/cmake
#  core/libaio
#  core/libxml2
#  core/pkg-config
#  core/m4
#  core/libbsd
#  core/libedit
#  core/texinfo
#  paulczar/jemalloc
)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)
pkg_expose=(3306)


do_build() {
#    [[ -e /usr/bin/env ]] || ln -s /hab/pkgs/core/coreutils/8.24/20160612075329/bin/env /usr/bin/env
  curl -k https://bootstrap.pypa.io/get-pip.py | python
  pip install scons
    cd galera
    pwd
    scons
}

do_install() {

  echo 1
#  make install
}

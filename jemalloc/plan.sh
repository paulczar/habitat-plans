pkg_origin=paulczar
pkg_name=jemalloc
pkg_version=4.2.1
#pkg_maintainer="Paul Czarkowski <username.taken@gmail.com>"
pkg_license=("https://github.com/jemalloc/jemalloc/blob/dev/COPYING")
pkg_source=http://github.com/jemalloc/jemalloc/releases/download/${pkg_version}/jemalloc-${pkg_version}.tar.bz2
pkg_shasum=5630650d5c1caab95d2f0898de4fe5ab8519dc680b04963b38bb425ef6a42d57
pkg_deps=()
pkg_build_deps=(
  core/coreutils
  core/gcc
  core/make
  core/cmake
)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)

do_build() {
    ./configure --prefix=${pkg_prefix}
    make
}

do_install() {
    make install
}

pkg_origin=paulczar
pkg_name=pip
pkg_version=8.1.2
pkg_maintainer="Paul Czarkowski <username.taken@gmail.com>"
pkg_license=("Apache 2.0")
pkg_source=https://github.com/pypa/pip/archive/8.1.2.tar.gz
pkg_shasum=8dae1fb72e29c2b6ff6ed267861179216bf98d3bda6d30e527dbed0db5ac7e1d

pkg_deps=(
)

pkg_build_deps=(
  core/python2
)

pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)

do_build() {
    python setup.py install --prefix=${pkg_prefix}
}

do_install() {
    python setup.py install --prefix=${pkg_prefix}
}

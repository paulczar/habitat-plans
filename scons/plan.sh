pkg_origin=paulczar
pkg_name=scons
pkg_version=2.5.0
pkg_maintainer="Paul Czarkowski <username.taken@gmail.com>"
pkg_license=("Apache 2.0")
pkg_source=http://prdownloads.sourceforge.net/scons/scons-${pkg_version}.tar.gz
pkg_shasum=eb296b47f23c20aec7d87d35cfa386d3508e01d1caa3040ea6f5bbab2292ace9
# mysqld_safe
pkg_deps=(
)

pkg_build_deps=(
  core/make
  core/gcc
  core/python2
)

pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)
pkg_expose=(3306)

do_build() {
    python setup.py install --prefix=${pkg_prefix}
}

do_install() {
    python setup.py install --prefix=${pkg_prefix}
}

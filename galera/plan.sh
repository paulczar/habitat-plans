pkg_origin=paulczar
pkg_name=galera
pkg_version=3-25.3.16
pkg_maintainer="Paul Czarkowski <username.taken@gmail.com>"
pkg_license=("Apache 2.0")
pkg_source=http://releases.galeracluster.com/source/galera-${pkg_version}.tar.gz
pkg_shasum=e123a7c5a054e377f94c6113eb62295bb7da82b5ab03cbf9505a0903ddbf995b

pkg_deps=(
  core/gcc-libs
  core/openssl
  core/glibc
  core/boost
)

pkg_build_deps=(
  paulczar/scons
  core/coreutils
  core/python2
  core/gcc
  core/gcc-libs
  core/boost159
  core/openssl
  core/check
  core/glibc
  core/git
)

pkg_lib_dirs=(lib)
pkg_bin_dirs=(bin)


do_prepare() {
    export CXXFLAGS="$CFLAGS"
    export RUN_TESTS=0
    export SCONS_OPTS="strict_build_flags=0 --config=force"
    export EXTRA_SYSROOT="${pkg_prefix}"
}

do_build() {
    scripts/build.sh 
}

do_install() {
    echo installing libgalera_smm.so to $pkg_prefix/lib
    mkdir -p $pkg_prefix/lib
    mkdir -p $pkg_prefix/bin
    install -Dm0644 libgalera_smm.so $pkg_prefix/lib/libgalera_smm.so
    install -Dm0755 garb/garbd $pkg_prefix/bin/garbd
    install -Dm0644 scripts/packages/README $pkg_prefix/README
    install -m0644 scripts/packages/README-MySQL $pkg_prefix/README-MySQL
    install -m0644 COPYING $pkg_prefix/COPYING    
}

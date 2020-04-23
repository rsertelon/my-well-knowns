pkg_name=my-well-known
pkg_origin=rsertelon
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('Unlicense')
pkg_deps=(
  rsertelon/thttpd
)

pkg_version() {
  date +%s
}

do_before() {
  update_pkg_version
}

do_build() {
  return 0
}

do_install() {
  mkdir -p "${pkg_prefix}/webroot"
  cp -R "$PLAN_CONTEXT/../.well-known" "${pkg_prefix}/webroot"
  # Prevent index pages by thttpd
  find "${pkg_prefix}/webroot" -type d -exec chmod 711 {} \;
}

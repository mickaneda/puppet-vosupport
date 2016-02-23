#
define vosupport::virtual_setupgridmapdir (
  $number,
  $prefix     = $name,
  $start      = 1,
  $digits     = 3,
  $gridmapdir = '/etc/grid-security/gridmapdir',
  $voname     = '',) {
  @vosupport::setupgridmapdir { $name:
    prefix     => $prefix,
    number     => $number,
    start      => $start,
    digits     => $digits,
    gridmapdir => $gridmapdir,
    voname     => $voname,
  }
}

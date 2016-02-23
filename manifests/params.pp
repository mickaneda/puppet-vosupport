# parameter set for the vosupport module
class vosupport::params {
  $m                            = 'vosupport'
  # list of supported VOs we want to enable
  $supported_vos                = hiera("${m}::supported_vos", [])
  # whether to create pool accounts
  $enable_poolaccounts          = hiera("${m}::enable_poolaccounts", true)
  # a service to enable mkgridmap for (LFC...)
  $enable_mkgridmap_for_service = hiera("${m}::enable_mkgridmap_for_service",
  undef)
  # a service to enable mappings for (WMS, ARGUS...)
  $enable_mappings_for_service  = hiera("${m}::enable_mappings_for_service",
  undef)
  # whether to set up the gridenv for these VOs
  $enable_environment           = hiera("${m}::enable_environment", true)
  # whether to enable VOMS client for these VOs
  $enable_voms                  = hiera("${m}::enable_voms", true)
  # if specified, create and populate gridmapdir with pool accounts and sets
  # the ownership of the gridmapdir to the specified group name
  $enable_gridmapdir_for_group  = hiera("${m}::enable_gridmapdir_for_group",
  undef)

  $poolaccounts                 = hiera_hash("${m}::poolaccounts", undef)

  $vo2gidmap                    = hiera("${m}::vo2gidmap", undef)

  # create file fragments for the specified VO and service
  $vomappingdata                = hiera_hash("${m}::mappings", undef)

  $vomsservers                  = hiera_hash("${m}::vomsservers", undef)

  $configfile                   = '/etc/lcgdm-mkgridmap.conf'

  $voenvdefaults                = hiera_hash("${m}::voenv", undef)
}

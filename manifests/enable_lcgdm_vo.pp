#
define vosupport::enable_lcgdm_vo (
  $vomappingdata,
  $poolaccounts,
  $vomsservers,
  $configfile,
  $voname                = $name,
  $unprivilegedmkgridmap = false,
  $gridservice           = 'LFC',) {
  concat::fragment { "${voname}_lcgdmmkgridmapconf":
    target  => $configfile,
    order   => '08',
    content => template('vosupport/lcgdm-mkgridmap.conf.erb'),
  }

}

# initialize VO environment virtual resources
class vosupport::vo_environment (
  $voenvdefaults = $vosupport::params::voenvdefaults) inherits vosupport::params
{
  $gridenvfile = '/etc/profile.d/grid-vo-env.sh'

  $comment1 = "# ${gridenvfile} is managed by Puppet env.pp."
  $comment2 = '#Any changes in here will be overwritten'
  concat { $gridenvfile:
    owner => 'root',
    group => 'root',
    mode  => '0755',
    warn  => "${comment1}\n${comment2}",
  }

  concat::fragment { 'grid-vo-env header':
    target  => $gridenvfile,
    order   => '01',
    content => template('vosupport/gridenvsh_header.erb')
  }

  concat::fragment { 'grid-vo-env footer':
    target  => $gridenvfile,
    order   => '99',
    content => template('vosupport/gridenvsh_footer.erb')
  }

  #
  # add csh support
  #
  file { '/etc/profile.d/grid-vo-env.csh':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('vosupport/grid-vo-env.csh.erb'),
  }

  create_resources('vosupport::virtual_voenv', $voenvdefaults)
}


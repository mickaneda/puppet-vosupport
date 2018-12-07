class vosupport(
  $env_file = lookup("env_file", {default_value => ""})
)
{

  file {"grid-env-funcs.sh":
    path => "/usr/libexec/grid-env-funcs.sh",
    source => "puppet:///modules/vosupport/grid-env-funcs.sh",
    owner => "root",
    group => "root",
    mode => "0644",
  }
  file {"clean-grid-env-funcs.sh":
    path => "/usr/libexec/clean-grid-env-funcs.sh",
    source => "puppet:///modules/vosupport/clean-grid-env-funcs.sh",
    owner => "root",
    group => "root",
    mode => "0644",
  }

  $gridenvfile = "/etc/profile.d/grid-vo-env.sh"

  concat{$gridenvfile:
    owner =>  "root",
    group =>  "root",
    mode  =>  "0755",
    warn => "# $gridenvfile is managed by Puppet env.pp.\n#Any changes in here will be overwritten\n\n",
  }

  concat::fragment{"grid-vo-env header":
    target  => $gridenvfile,
    order   => "01",
    content => template("vosupport/gridenvsh_header.erb")
  }
  if $env_file {
    concat::fragment{'grid-vo-env others':
      target  => $gridenvfile,
      order   => "50",
      source => $env_file,
    }
  }

  concat::fragment{"grid-vo-env footer":
    target  => $gridenvfile,
    order   => "99",
    content => template('vosupport/gridenvsh_footer.erb')
  }

  #
  # add csh support
  #
  file {"/etc/profile.d/grid-vo-env.csh":
    ensure => present,
    owner => "root",
    group => "root",
    mode => "0755",
    content => template("vosupport/grid-vo-env.csh.erb"),
  }
}

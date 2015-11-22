class apt {

  file { '/etc/apt/sources.list' :
    # source => 'puppet:///modules/apt/files/sources.list',
    source => '/home/chris/puppet/modules/apt/files/sources.list',
  }

  exec { 'update' :
    command => '/usr/bin/apt-get update',
    require => File['/etc/apt/sources.list'],
  }

  exec { 'upgrade' :
    command => '/usr/bin/apt-get -y upgrade',
    timeout => 0,
    require => Exec['update'],
  }
  
}

class puppet {

  file {'/usr/local/bin/papply' :
    source => '/home/ubuntu/puppet/modules/puppet/files/papply.sh',
    mode   => '0755',
  }

  file {'/usr/local/bin/pull-updates' :
    source => '/home/ubuntu/puppet/modules/puppet/files/pull-updates.sh',
    mode   => '0755',
  }

  file {'/home/ubuntu/.ssh/id_rsa' :
    source => '/home/ubuntu/puppet/modules/puppet/files/ubuntu.priv',
    owner  => 'ubuntu',
    mode   => '0600',
  }

  cron {'run puppet':
    ensure => 'present',
    user   => 'ubuntu',
    command => '/usr/local/bin/pull-updates',
    minute  => '*/10',
    hour     => '*',
  }

}

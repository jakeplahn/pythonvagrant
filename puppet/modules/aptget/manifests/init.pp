class aptget {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update --fix-missing',
    timeout => 0,
  }
  exec { 'apt-get make install':
    command => '/usr/bin/apt-get install make',
    timeout => 0,
    require => Exec['apt-get update'],
  }
}

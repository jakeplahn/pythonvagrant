class python3 {
  exec { 'download source':
    command => 'wget https://www.python.org/ftp/python/3.5.1/Python-3.5.1.tgz',
    timeout => 0,
    require => Exec['apt-get make install'],
  }
  exec { 'extract':
    command => 'tar xzvf Python-3.5.1.tgz',
    timeout => 0,
    require => Exec['download source'],
  }
  exec { 'configure':
    command   => 'sudo /home/vagrant/Python-3.5.1/configure',
    cwd       => '/home/vagrant/Python-3.5.1',
    timeout   => 0,
    logoutput => true,
    require   => Exec['extract'],
  }
  exec { 'make':
    command   => 'sudo make',
    cwd       => '/home/vagrant/Python-3.5.1',
    timeout   => 0,
    logoutput => true,
    path      =>  [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
    require   => Exec['configure'],
  }
  exec { 'make install':
    command   => 'sudo make install',
    cwd       =>  '/home/vagrant/Python-3.5.1',
    timeout   => 0,
    logoutput => true,
    require   => Exec['make'],
  }
}

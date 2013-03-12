class timer_entropyd::package {
  file { 'timer-entropyd-deb':
    path   => '/usr/local/src/timer-entropyd_0.1-1_amd64.deb',
    owner  => root,
    group  => root,
    mode   => '0755',
    source => "puppet:///modules/${module_name}/timer-entropyd_0.1-1_amd64.deb"
  }

  package { 'timer-entropyd':
    provider => dpkg,
    ensure   => latest,
    source   => '/usr/local/src/timer-entropyd_0.1-1_amd64.deb',
    require  => File['timer-entropyd-deb']
  }
}

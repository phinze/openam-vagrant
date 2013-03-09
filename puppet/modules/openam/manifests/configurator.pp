class openam::configurator {
  file { '/var/lib/openam':
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => '0755'
  }

  file { '/var/lib/openam/configurator.jar':
    owner     => root,
    group     => root,
    mode      => '0755',
    source    => "puppet:///modules/${module_name}/openam-distribution-configurator-10.1.0-Xpress.jar"
  }
}

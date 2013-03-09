class openam::config(
  $server_url,
  $deployment_uri,
  $amadmin_password,
  $config_root
){
  file { '/etc/openam':
    ensure  => directory,
    owner   => root,
    group   => tomcat6,
    mode    => '0775'
  }

  file { '/etc/openam/initial_configuration.properties':
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('openam/initial_configuration.properties')
  }

  exec { 'openam-configurator':
    command   => 'java -jar /var/lib/openam/configurator.jar -f /etc/openam/initial_configuration.properties',
    logoutput => true,
    require   => File['/etc/openam/initial_configuration.properties'],
    creates   => '/etc/openam/bootstrap'
  }
}

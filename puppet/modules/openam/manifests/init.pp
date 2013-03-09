class openam(
  $server_url = "http://${fqdn}",
  $deployment_uri = '/openam',
  $config_root = '/etc/openam/',
  $amadmin_password = 'adminadmin',
  $port = '80'
){

  class { 'tomcat':
    port => $port
  }

  include openam::war
  include openam::configurator
  class { 'openam::config':
    server_url       => $server_url,
    config_root      => $config_root,
    amadmin_password => $amadmin_password,
    deployment_uri   => $deployment_uri
  }

  Class['tomcat'] ->
    Class['openam::war'] ->
    Class['openam::configurator'] ->
    Class['openam::config'] ->
    Class['openam']
}

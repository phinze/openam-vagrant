class openam(
  $server_url = "http://${fqdn}",
  $deployment_uri = '/openam',
  $config_root = '/etc/openam/',
  $amadmin_password = 'adminadmin',
  $port = '80'
){

  class { 'openam::prereqs':
    port => $port
  }

  include openam::download
  include openam::war
  include openam::configurator

  class { 'openam::config':
    server_url       => $server_url,
    config_root      => $config_root,
    amadmin_password => $amadmin_password,
    deployment_uri   => $deployment_uri
  }

  class { 'openam::admin_tools':
    amadmin_password => $amadmin_password
  }

  Class['openam::prereqs'] ->
    Class['openam::download'] ->
    Class['openam::war'] ->
    Class['openam::configurator'] ->
    Class['openam::config'] ->
    Class['openam::admin_tools'] ->
    Class['openam']
}

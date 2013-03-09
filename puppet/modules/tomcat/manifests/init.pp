class tomcat(
  $port = 8080
){
  include tomcat::package

  class { 'tomcat::config':
    port     => $port,
    authbind => ($port <= 1024)
  }

  include tomcat::service

  Class['tomcat::package'] ->
  Class['tomcat::config'] ->
    Class['tomcat::service'] ->
    Class['tomcat']
}

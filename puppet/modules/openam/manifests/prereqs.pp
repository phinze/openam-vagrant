class openam::prereqs(
  $port
){
  class { 'tomcat':
    port => $port
  }
  package { 'unzip': ensure => installed }
}

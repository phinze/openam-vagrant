class openam::prereqs(
  $port
){
  # our web container
  class { 'tomcat':
    port => $port
  }

  # required to extract the source files
  package { 'unzip': ensure => installed }

  # ssoadm will hang for inordinate amounts of time without a healthy amount of
  # entropy in /dev/random, which on virtualized hardware we won't get without
  # some help
  include timer_entropyd
}

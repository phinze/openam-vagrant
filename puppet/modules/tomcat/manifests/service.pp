class tomcat::service {
  service { 'tomcat6':
    hasrestart => true,
    ensure => running,
    subscribe => Class['tomcat::config']
  }
}

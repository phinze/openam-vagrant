class tomcat::config(
  $port,
  $authbind
){
  file { '/etc/tomcat6/server.xml':
    owner   => 'root',
    group   => 'tomcat6',
    mode    => '0644',
    content => template('tomcat/server.xml')
  }

  file { '/etc/default/tomcat6':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('tomcat/tomcat6')
  }

  # fix tomcat user homedir permissions
  # openam will not deploy unless it can write here
  file { '/usr/share/tomcat6':
    ensure => directory,
    owner  => 'tomcat6',
    group  => 'tomcat6',
    mode   => '0755'
  }
}

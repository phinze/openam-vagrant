class openam::war {
  # sleep 10 a hack to let tomcat autodeploy settle in before attempting any interaction with the webapp
  exec { 'install-openam-war':
    command => 'cp /usr/local/src/openam/openam-server-10.1.0-Xpress.war /var/lib/tomcat6/webapps/openam.war && sleep 10',
    user    => 'tomcat6',
    creates => '/var/lib/tomcat6/webapps/openam.war'
  }
}

class openam::war {
  $openam_url = 'http://download.forgerock.org/downloads/enterprise/openam/openam10/10.1.0/openam_10.1.0.war'

  exec { 'download-openam-war':
    command => "wget ${openam_url} -O /tmp/openam.war && mv /tmp/openam.war . && sleep 10",
    cwd     => '/var/lib/tomcat6/webapps/',
    user    => 'tomcat6',
    creates => '/var/lib/tomcat6/webapps/openam.war'
  }
}

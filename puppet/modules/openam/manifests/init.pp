class openam(
  $port = '80'
){
  $openam_download_location = 'http://download.forgerock.org/downloads/enterprise/openam/openam10/10.1.0/openam_10.1.0.war'
  $openam_war_filename = 'openam_10.1.0.war'

  class { 'tomcat':
    port => $port
  }

  exec { 'download-openam-war':
    command => "wget ${openam_download_location}",
    cwd => '/var/lib/tomcat6/webapps/',
    creates => "/var/lib/tomcat6/webapps/${openam_war_filename}",
    notify => Class['tomcat']
  }
}

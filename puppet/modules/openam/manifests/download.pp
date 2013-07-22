class openam::download {
  $openam_url = 'https://dl.dropboxusercontent.com/u/12210925/dist/openam_10.1.0.zip'

  exec { 'download-openam':
    timeout => 0,
    command => "wget ${openam_url}",
    cwd     => '/vagrant',
    creates => '/vagrant/openam_10.1.0.zip'
  }

  file { '/usr/local/src/openam':
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => '0755'
  }

  exec { 'unzip-openam':
    command => 'unzip -d openam /vagrant/openam_10.1.0.zip',
    cwd     => '/usr/local/src',
    creates => '/usr/local/src/openam/openam-server-10.1.0-Xpress.war',
    require => [
      Package['unzip'],
      Exec['download-openam'],
      File['/usr/local/src/openam']
    ]
  }
}

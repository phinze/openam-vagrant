class openam::admin_tools(
  $amadmin_password
){
  file { '/var/lib/openam/admintools':
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => '0755'
  }

  file { '/etc/openam/.amadmin_password':
    owner   => root,
    group   => root,
    mode    => '0400',
    content => "${amadmin_password}\n"
  }

  exec { 'unzip-admintools':
    command => 'unzip -d /var/lib/openam/admintools openam-distribution-ssoadmintools-10.1.0-Xpress.zip',
    cwd     => '/usr/local/src/openam',
    creates => '/var/lib/openam/admintools/setup',
    require => File['/var/lib/openam/admintools']
  }

  exec { 'setup-admintools':
    command     => '/var/lib/openam/admintools/setup -p /etc/openam',
    environment => 'JAVA_HOME=/usr/lib/jvm/java-6-openjdk-amd64/jre/',
    cwd         => '/var/lib/openam/admintools',
    creates     => '/var/lib/openam/admintools/openam/bin/ssoadm',
    logoutput   => true,
    require     => Exec['unzip-admintools']
  }

  file { '/usr/local/bin/ssoadm':
    owner     => root,
    group     => root,
    mode      => '0755',
    source    => "puppet:///modules/${module_name}/admin_tools/ssoadm"
  }

}

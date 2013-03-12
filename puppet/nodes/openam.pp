node 'openam.vagrant.dev' {
  # a few support packages
  package { [
    'vim-nox',
    'curl'
    ]:
    ensure => installed
  }

  include openam
  openam::circle_of_trust { 'vagrant': }

  openam::identity_provider { 'vagrant-idp':
    circle_of_trust        => 'vagrant',
    entity                 => "http://${fqdn}/openam",
    signing_certificate    => 'test',
    encryption_certificate => 'test'
  }

  openam::user { 'openamuser':
    password       => 'useruser',
    email_address => 'user@example.com'
  }
}

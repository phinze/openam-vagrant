node 'openam.vagrant.dev' {
  # a few support packages
  package { [
    'vim-nox',
    'curl'
    ]:
    ensure => installed
  }

  include openam
}

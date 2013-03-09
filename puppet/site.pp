import 'nodes/**/*.pp'

Exec['apt-get-update'] -> Package <| |>

Exec {
  path => '/usr/bin:/usr/sbin:/bin'
}

exec { 'apt-get-update':
  command => 'apt-get update'
}

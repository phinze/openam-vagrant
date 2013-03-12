class timer_entropyd {
  include timer_entropyd::package
  include timer_entropyd::service

  Class['timer_entropyd::package'] ->
    Class['timer_entropyd::service'] ->
    Class['timer_entropyd']
}

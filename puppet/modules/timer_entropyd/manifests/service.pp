class timer_entropyd::service {
  service { 'timer-entropyd':
    ensure => running
  }
}

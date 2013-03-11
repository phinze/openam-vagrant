define openam::circle_of_trust(
  $cot_name = $title,
  $realm = '/'
) {
  exec {"${cot_name}-create-cot":
    command   => "ssoadm create-cot --cot ${cot_name} --realm ${realm} --verbose",
    unless    => "ssoadm list-cots | grep ${cot_name}",
    logoutput => true,
    require   => Class['openam']
  }
}


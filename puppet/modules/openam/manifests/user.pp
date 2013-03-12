define openam::user(
  $userid = $title,
  $realm = '/',
  $password,
  $email_address
) {
  exec { "create-user-${userid}":
    command => "ssoadm create-identity                                     \
      --realm ${realm}                                                     \
      --idname '${userid}'                                                 \
      --idtype User                                                        \
      --attributevalues 'userpassword=${password}' 'mail=${email_address}'
    ",
    logoutput => true,
    unless    => "ssoadm list-identities --realm ${realm} --idtype User --filter '${userid}' | grep '${userid}'",
    require   => Class['openam']
  }

}

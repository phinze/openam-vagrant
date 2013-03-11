define openam::identity_provider(
  $entity_shortname = $title,
  $realm = '/',
  $circle_of_trust,
  $entity,
  $signing_certificate,
  $encryption_certificate
) {
  exec { "${entity_shortname}-create-metadata":
    command => "ssoadm create-metadata-templ   \
      --meta-data-file /tmp/metadata.xml       \
      --extended-data-file /tmp/extended.xml   \
      --identityprovider ${realm}              \
      --idpscertalias ${signing_certificate}   \
      --idpecertalias ${encryption_certificate} \
      --entityid ${entity}",
    logoutput => true,
    unless    => "ssoadm list-entities | grep '${entity}'",
    require   => Openam::Circle_Of_Trust[$circle_of_trust]
  }

  exec { "${entity_shortname}-import-entity":
    command => "ssoadm import-entity \
      --meta-data-file /tmp/metadata.xml       \
      --extended-data-file /tmp/extended.xml   \
      --cot ${circle_of_trust}
    ",
    logoutput   => true,
    subscribe   => Exec["${entity_shortname}-create-metadata"],
    refreshonly => true
  }
}

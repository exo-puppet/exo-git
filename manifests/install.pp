# Ensure to keep up-to-date puppet agent
class git::install {
  case $::operatingsystem {
    /(Ubuntu)/ : {
      ensure_packages ($git::params::package_name, { 'ensure' => $git::lastversion ? {
        true    => latest,
        default => present,
      },
        'require' => Class['apt::update']
      } )
    }
  }

}

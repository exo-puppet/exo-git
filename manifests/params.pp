# Ensure to keep up-to-date puppet agent
class git::params {
  case $::operatingsystem {
    /(Ubuntu)/ : {
      $package_name = ['git-core', 'git-svn']
    }
    default    : {
      fail("The ${module_name} module is not supported on ${::operatingsystem}")
    }
  }
}

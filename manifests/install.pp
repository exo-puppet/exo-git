# Ensure to keep up-to-date puppet agent
class git::install {
  case $::operatingsystem {
    /(Ubuntu)/ : {
      if ($git::use_ppa == true) {
        repo::define { 'git-core-ppa-repo':
          file_name  => 'git-core-ppa',
          url        => 'http://ppa.launchpad.net/git-core/ppa/ubuntu',
          sections   => [
            'main'],
          source     => true,
          key        => 'E1DF1F24',
          key_server => 'keyserver.ubuntu.com',
          notify     => Exec['repo-update'],
        }

        package { 'git':
          ensure  => $git::lastversion ? {
            true    => latest,
            default => present,
          },
          name    => $git::params::package_name,
          require => [
            Repo::Define['git-core-ppa-repo'],
            Exec['repo-update']],
        }
      } else {
        package { 'git':
          ensure  => $git::lastversion ? {
            true    => latest,
            default => present,
          },
          name    => $git::params::package_name,
          require => [
            Exec['repo-update']],
        }
      }
    }
  }

}

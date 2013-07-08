define git::clone (
  $url,
  $path,
  $user) {
  info("Cloning repository ${url} into ${path} with user ${user}")

  exec { "git-clone-${path}":
    command   => "git clone ${url} ${path}",
    path      => '/usr/bin',
    user      => $user,
    group     => $user,
    logoutput => true,
    creates   => "${path}/.git",
    require   => [
      File[$path],
      Class['git::install']],
  }
}

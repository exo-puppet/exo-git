# Ensure to keep up-to-date puppet agent
class git {
	package {
		"python-software-properties" :
			ensure => latest,
	}
	exec {
		"/usr/bin/add-apt-repository ppa:git-core/ppa" :
			alias => "add-git-ppa-repo",
			require => [Package["python-software-properties"]],
	}
	package {
		"git" :
			ensure => latest,
			require => [Exec["add-git-ppa-repo"]],
	}
}
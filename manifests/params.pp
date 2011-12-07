# Ensure to keep up-to-date puppet agent
class git::params {

    case $::operatingsystem {
        /(Ubuntu|Debian)/: {
            $package_name   = "git"
        }
    }
}
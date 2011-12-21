# Ensure to keep up-to-date puppet agent
class git::params {

    case $::operatingsystem {
        /(Ubuntu|Debian)/: {
            $package_name   = "git"
        }
        default: {
            fail ("The ${module_name} module is not supported on $::operatingsystem")
        }        
    }
}
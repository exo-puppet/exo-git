# Ensure to keep up-to-date puppet agent
class git::params {

    case $::operatingsystem {
        /(Ubuntu)/: {
            case $::lsbdistrelease {
                "10.04": {
                    $package_name   = "git-core"
                }
                default: {
                    $package_name   = "git"
                }
            }
        }
        default: {
            fail ("The ${module_name} module is not supported on $::operatingsystem")
        }        
    }
}
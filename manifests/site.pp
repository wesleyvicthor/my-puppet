# site.pp
include "apt"
iapt::ppa { "ppa:ondrej/php5": }

package {
    ["php5-curl", "php5-fpm", "php5-common", "php5", "php5-cli", "php5-sqlite", "php5-gd", "php5-xdebug"]:
	ensure=> installed
}

package {
    ["nginx"]:
	ensure=> installed
}

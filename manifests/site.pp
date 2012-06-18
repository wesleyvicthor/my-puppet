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

file {
    "nginx.conf":
        path => /etc/nginx/, 
	source => "puppet:///nginx/nginx.conf";
    "fastcgi_params":
	path => /etc/nginx/,
        source => "puppet:///nginx/fastcgi_params";
	
    "fastcgi.conf":
	path => /etc/nginx/,
        source => "puppet:///nginx/fastcgi.conf";

    "mime.types":
        path => /etc/nginx/,
        source => "puppet:///nginx/mime.types";

    "uwsgi_params":
        path => /etc/nginx/,
        source => "puppet:///nginx/uwsgi_params";
}

service {
    "nginx":
        name => "nginx",
        enable => true,
        ensure => running,
        hasrestart => true,
        require => Package["nginx"];

}

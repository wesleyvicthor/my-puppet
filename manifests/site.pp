# site.pp
include "apt"
include "vim"
include "mysql"
include "php"
include "php::pecl::xdebug"
include "php::pecl::gd"
include "php::pecl::curl"
include "php::pecl::sqlite"
include "git"
include "apache"

package {"libapache2-mod-php5":
    ensure => "installed"
}

apache::module {
    [
        "php5",
        "rewrite"
    ]:
    ensure => 'present'
}

apt::ppa {"ppa:ondrej/php5":}

apache::vhost{
    [
        "app.local",
    ]:
    replace => true,
}

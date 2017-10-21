#!/usr/bin/env bash
set -xeu

function install_extension() {
	name=$1
	pecl install "$@" && echo "extension=$name.so" > "/usr/local/etc/php/conf.d/$name.ini"
}
function install_zend_extension() {
	name=$1
	pecl install "$@" && echo "zend_extension=$name.so" > "/usr/local/etc/php/conf.d/$name.ini"
}
#apt-get update -y

# Extensions I use
install_extension ast
install_extension igbinary
yes ''|install_extension redis

#apt-get install libmemcached-dev zlib1g zlib1g-dev -y
yes ''|install_extension memcached

# Commonly used extensions
#apt-get install libyaml-dev -y
yes ''|install_extension yaml

#apt-get install libzip-dev -y
yes ''|install_extension zip
install_extension apcu -y
yes ''|install_extension apcu_bc-1.0.3
echo "extension=apc.so" > "/usr/local/etc/php/conf.d/apcu_bc-1.0.3.ini"
install_extension mailparse
#apt-get install libssl-dev -y
yes ''|install_extension mongodb

yes ''|install_zend_extension xdebug

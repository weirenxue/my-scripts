#!/bin/bash

phpversion=7.4
package=(
            'nginx'

            'php'$phpversion
            'php-fpm'
            'php-common'
            'php-xml'
            'php-json'
            'php-mysql'
            'php-pgsql'
            'php-curl'
            'php-mbstring'
            'php-gd'
            'php-cli'
            'php'$phpversion'-phalcon'

            'openssl'
        )

apt-get install nginx -y
apt-add-repository ppa:ondrej/php -y
apt-get update
apt-get install ${package[*]} -y 

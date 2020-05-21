#!/bin/bash

package=(   'gcc'
            'make'
            'perl'
            'git'
            'vim')
#${array_name[*]}:list all element

apt-get update && apte-get upgrade -y
apt-get install ${package[*]} -y
apt-get autoremove

#!/bin/bash

source ./func.sh

label "⧖ Installing PHP-FPM (7.4).."

install "software-properties-common" "software-properties-common"
sudo add-apt-repository ppa:ondrej/php -y  > /dev/null 2>&1
update

install "PHP-FPM" "php7.4-fpm"
install "Composer" "composer"

overwrite "✓ PHP-FPM (7.4) Installed."
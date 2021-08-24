#!/bin/bash

ARG=$1

# Overwrite last line of output
overwrite() { 
	echo -e "\r\033[1A\033[0K$@"; 
}

label() {
	echo "$1"
	sleep 1s
}

# Update (and upgrade) apt package list
update() {
	overwrite "⧖ Updating package list.."
	sudo apt-get update > /dev/null 2>&1
	overwrite "✓ Packages updated"

	# Upgrade packages
	if [ "$ARG" == "upgrade" ]; then
		overwrite "⧖ Upgrading packages.."
		sudo apt-get upgrade -yq > /dev/null 2>&1
		overwrite "✓ Packages upgraded"
	fi
}

# Install a system package with apt-get
install() {
	overwrite "⧖ Installing $1 ($2).."
	sudo apt-get install -y $2 > /dev/null 2>&1
	overwrite "✓ Package '$2' installed"
}

# Start services
start() {
	label "⧖ Starting services.."
	sudo service nginx restart > /dev/null 2>&1 # NGINX
	sudo service php7.3-fpm restart > /dev/null 2>&1 # PHP-FPM
	overwrite "✓ Services started."
}

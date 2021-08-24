#!/bin/bash

DEBIAN_FRONTEND=noninteractive

source ./func.sh

echo "-- debwebdev installer --"
echo "⧖ Preparing.."
update "upgrade"

# Install packages
source ./src/python3.sh
source ./src/nginx.sh
source ./src/php-fpm.sh

start
echo "----"
echo "✓ debwebdev tools installed"
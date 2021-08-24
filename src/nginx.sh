#!/bin/bash

source ./func.sh

label "⧖ Installing NGINX.."

# Changing this variable requires a change to localhost.conf and selfisgned.conf too
NGINX_CERT="selfsigned"
NGINX_CERT_CN="localhost"

install "NGINX" "nginx"
install "OpenSSL" "openssl"

overwrite "⧖ Generating SSL certificate.."
openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out ~/$NGINX_CERT.crt -keyout ~/$NGINX_CERT.key -subj "/C=SI/ST=Ljubljana/L=Ljubljana/O=Security/OU=IT Department/CN=$NGINX_CERT_CN" > /dev/null 2>&1

overwrite "⧖ Installing certificate.."
sudo mv ~/$NGINX_CERT.crt /etc/ssl/certs/$NGINX_CERT.crt > /dev/null 2>&1
sudo mv ~/$NGINX_CERT.key /etc/ssl/private/$NGINX_CERT.key > /dev/null 2>&1

overwrite "⧖ Copying files.."
sudo cp -n ./files/nginx/localhost.conf /etc/nginx/sites-available/localhost.conf > /dev/null 2>&1
sudo cp -n ./files/nginx/$NGINX_CERT.conf /etc/nginx/snippets/$NGINX_CERT.conf > /dev/null 2>&1
sudo cp -n ./files/nginx/fastcgi-php.local.conf /etc/nginx/snippets/fastcgi-php.local.conf > /dev/null 2>&1

overwrite "⧖ Creating symlinks.."
sudo ln -s -n /etc/nginx/sites-available/localhost.conf /etc/nginx/sites-enabled/localhost.conf > /dev/null 2>&1

overwrite "⧖ Cleaing up.."
sudo rm /etc/nginx/sites-enabled/default > /dev/null 2>&1

overwrite "✓ NGINX Installed."
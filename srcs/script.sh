#!/bin/bash

mkdir var/www/localhost

#SERVICE LAUNCH
service php7.3-fpm start
service nginx start

#SSL CERTIFICATE
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=AURA/L=Lyon/O=42/OU=sylducam/CN=localhost"
sudo mv self-signed.conf /etc/nginx/snippets/
sudo mv ssl-params.conf /etc/nginx/snippets/
sudo cp /nginx_params/default /etc/nginx/sites-available/default

#MYSQL
service mysql start
sudo mysql_secure_installation
mysql -u root  < mysql.sql

#WORDPRESS
wget https://wordpress.org/latest.tar.gz
tar xf latest.tar.gz
mv wordpress var/www/localhost/

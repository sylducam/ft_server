#!/bin/bash

#SERVICE LAUNCH
service php7.3-fpm start
service nginx start

#SSL CERTIFICATE
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=AURA/L=Lyon/O=42/OU=sylducam/CN=localhost/emailAddress=sylducam@student.42-lyon.fr"
sudo mv self-signed.conf /etc/nginx/snippets
sudo mv ssl-params.conf /etc/nginx/snippets
sudo cp default /etc/nginx/sites-available/default

#MYSQL
service mysql start
sudo mysql_secure_installation
mysql -u root  < mysql.sql

#WORDPRESS
wget https://wordpress.org/latest.tar.gz
tar xf latest.tar.gz
mv wordpress /var/www/html

#PHPMYADMIN
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
tar xf phpMyAdmin-latest-all-languages.tar.gz
rm phpMyAdmin-latest-all-languages.tar.gz
mv phpMyAdmin* /var/www/html/phpmyadmin

#DISPLAY LOGS
service nginx restart
tail -f /var/log/nginx/access.log /var/log/nginx/error.log

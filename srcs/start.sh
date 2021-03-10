#!/bin/bash

#AUTOINDEX SWITCH
if [ "$AUTOINDEX" = "OFF" ]
	then
		sed -i 's/autoindex on;/autoindex off;/g' default
fi

#SERVICE LAUNCH
service php7.3-fpm start
service nginx start
chown -R www-data /var/www/*
chmod -R 755 /var/www/*
ln -s etc/nginx/sites-available/default etc/nginx/sites-enabled

#SSL CERTIFICATE
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=AURA/L=Lyon/O=42/OU=sylducam/CN=localhost/emailAddress=sylducam@student.42-lyon.fr"
sudo mv self-signed.conf /etc/nginx/snippets
sudo mv ssl-params.conf /etc/nginx/snippets
sudo cp default /etc/nginx/sites-available/default

#MYSQL
service mysql start
aptitude -y install expect
SECURE_MYSQL=$(expect -c "
set timeout 10
spawn mysql_secure_installation
expect \"Enter current password for root (enter for none):\"
send \"$MYSQL\r\"
expect \"Change the root password?\"
send \"n\r\"
expect \"Remove anonymous users?\"
send \"n\r\"
expect \"Disallow root login remotely?\"
send \"n\r\"
expect \"Remove test database and access to it?\"
send \"n\r\"
expect \"Reload privilege tables now?\"
send \"n\r\"
expect eof
")

echo "$SECURE_MYSQL"

aptitude -y purge expect
mysql -u root  < mysql.sql

#WORDPRESS
wget https://wordpress.org/latest.tar.gz
tar xf latest.tar.gz
mv wordpress /var/www/html
mv wp-config.php /var/www/html/wordpress

#PHPMYADMIN
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
tar xf phpMyAdmin-latest-all-languages.tar.gz
rm phpMyAdmin-latest-all-languages.tar.gz
mv phpMyAdmin* /var/www/html/phpmyadmin

#DISPLAY LOGS
service nginx restart
tail -f /var/log/nginx/access.log /var/log/nginx/error.log

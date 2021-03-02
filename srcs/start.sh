#!/bin/bash

#NGINX
#mkdir -p /var/www/localhost/html
#sudo chown -R $USER:$USER /var/www/localhost
#sudo chmod -R 755 /var/www/localhost
#mv localhost /etc/nginx/sites-available
mv default /etc/nginx/sites-available
#sudo ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

#SSL CERTIFICATE
#sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=AURA/L=Lyon/O=42/OU=sylducam/CN=localhost/emailAddress=sylducam@student.42-lyon.fr"
# essayes de ne pas mettre cette ligne et de virer sa correspondance dans ssl-params.conf
#sudo openssl dhparam -out /etc/nginx/dhparam.pem 2048
#sudo mv self-signed.conf /etc/nginx/snippets
#sudo mv ssl-params.conf /etc/nginx/snippets
SSL_CERTS=/etc/ssl/certs/localhost.pem
SSL_CERTS_KEY=/etc/ssl/certs/localhost-key.pem
if [[ ! -f "$SSL_CERTS" ]] || [[ ! -f "$SSL_CERTS_KEY" ]]
then
	echo "SSL certs does not exists boyzzz"
	chmod +x mkcert
	./mkcert -install
	./mkcert localhost
	mv localhost.pem /etc/ssl/certs/
	mv localhost-key.pem /etc/ssl/certs/
fi

#SERVICE LAUNCH
service php7.3-fpm start
service nginx start

#MYSQL
service mysql start
sudo mysql_secure_installation
mysql -u root < mysql.sql # ca ne marche pas

#WORDPRESS
wget https://wordpress.org/latest.tar.gz
tar xf latest.tar.gz
mv wordpress /var/www/localhost

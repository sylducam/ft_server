#!bin/bash

if cmp -s default /etc/nginx/sites-available/default
then
	cp autoindexoff /etc/nginx/sites-available/default
else
	cp default /etc/nginx/sites-available/default
fi
service nginx restart

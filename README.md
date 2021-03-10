# ft_server

Project meant to discover and use Docker by setting a unique container running with Debian Buster and setting an Nginx web server. This web server runs a Wordpress, PhpMyAdmin and MySQL.

# Commands to run the project

docker build -t ft_server .

with autoindex :
docker run -p 80:80 -p 443:443 -it --rm --name ft_server_ct ft_server
without autoindex :
docker run -p 80:80 -p 443:443 -e AUTOINDEX=OFF --rm --name ft_server_ct ft_server

to keep it running and open a terminal in Debian :

docker run -t -d -p 80:80 -p 443:443 --name ft_server_ct ft_server
docker exec -it ft_server_ct bash

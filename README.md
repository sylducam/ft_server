# ft_server

www.42lyon.fr school project meant to discover and use Docker by setting a unique container including four applications working together : Nginx, Wordpress, PhpMyAdmin and MySQL.

# Commands to run the project

1) Start Docker Desktop
2) type the following line in your terminal :
```docker build -t ft_server .```

The program is launchable with or without autoindex feature
autoindex on :
docker run -p 80:80 -p 443:443 -it --rm --name ft_server_ct ft_server
autoindex off :
docker run -p 80:80 -p 443:443 -e AUTOINDEX=OFF --rm --name ft_server_ct ft_server

To keep the container running and get a terminal opened in this container's OS :
docker run -t -d -p 80:80 -p 443:443 --name ft_server_ct ft_server && docker exec -it ft_server_ct bash

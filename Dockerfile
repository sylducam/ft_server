# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sylducam <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/25 11:33:57 by sylducam          #+#    #+#              #
#    Updated: 2021/03/05 10:53:05 by sylducam         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y sudo vim && sudo apt update && sudo apt install -y openssl nginx wget mariadb-server mariadb-client php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php-mbstring php-zip php-gd php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip

COPY srcs/ .

EXPOSE 80 443

ENTRYPOINT ["bash", "start.sh"]

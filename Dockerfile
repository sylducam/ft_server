# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sylducam <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/25 11:33:57 by sylducam          #+#    #+#              #
#    Updated: 2021/02/26 16:57:58 by sylducam         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y sudo openssl nginx && sudo apt install -y wget mariadb-server mariadb-client php-fpm php-mysql

COPY srcs/ .

EXPOSE 80 443

ENTRYPOINT ["bash", "script.sh"]

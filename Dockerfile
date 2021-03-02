# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sylducam <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/25 11:33:57 by sylducam          #+#    #+#              #
#    Updated: 2021/03/02 16:42:59 by sylducam         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y sudo vim && sudo apt update && sudo apt install -y openssl nginx wget libnss3-tools mariadb-server mariadb-client php-fpm php-mysql

COPY srcs/ .

EXPOSE 80 443

ENTRYPOINT ["bash", "start.sh"]

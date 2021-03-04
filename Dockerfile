# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sylducam <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/25 11:33:57 by sylducam          #+#    #+#              #
#    Updated: 2021/03/04 15:41:23 by sylducam         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y sudo vim && sudo apt update && sudo apt install -y openssl nginx wget mariadb-server php-fpm php-mysql

COPY srcs/ .

EXPOSE 80 443

ENTRYPOINT ["bash", "start.sh"]

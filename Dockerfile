FROM debian
LABEL maintainer="Thibaut BAYER<bt0r>"
RUN echo "Bienvenue sur votre première image docker"
COPY ./script.sh /root/script.sh
RUN chmod 777 /root/script.sh
ENTRYPOINT ["/root/script.sh"]

FROM debian:buster

RUN apt-get update -y && apt-get install -y sudo && sudo apt update && sudo apt install -y nginx
#ENTRYPOINT ["/root/script.sh"]

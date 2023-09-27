FROM debian:buster

RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install vim -y
RUN apt-get install curl -y
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/tbrulhar.crt \
    -keyout /etc/nginx/ssl/tbrulhar.key \
    -subj "/C=CH/ST=Vaud/L=Renens/O=42/OU=tbrulhar/CN=tbrulhar.42.fr/UID=login"
RUN mkdir -p /var/run/nginx

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

COPY ./conf/nginx.conf /etc/nginx/conf.d


CMD [ "nginx", "-g", "daemon off;" ]

FROM debian:buster

RUN apt-get update -y
RUN apt-get install -y mariadb-server zsh vim

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mysqlScript.sh /

RUN chmod +x mysqlScript.sh

CMD [ "./mysqlScript.sh" ]
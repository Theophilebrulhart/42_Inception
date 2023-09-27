FROM debian:buster
# installation des packet nécessaire
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y wget

# installations des packets PHP et MARIADB nécessaires pour wordpress
RUN apt-get install -y php7.3 php7.3-fpm php7.3-mysql mariadb-client

# Téléchargement de l'archive wordpress et décompression
RUN wget https://fr.wordpress.org/wordpress-6.2.2-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.2.2-fr_FR.tar.gz && rm wordpress-6.2.2-fr_FR.tar.gz

# Donner les droits nécessaire
RUN chown -R root:root /var/www/wordpress

# installations de wordpress CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

#  donner les droits nécessaire et dépalcement dans bin
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Copie du fichier de configuration "www.conf" pour PHP-FPM
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/

# Copie du fichier "auto_config.sh" dans le répertoire racine du conteneur
COPY conf/auto_config.sh /
RUN chmod +x auto_config.sh

# Copie du fichier "wp-config.php" dans le répertoire de Wordpress
COPY conf/wp-config.php /var/www/wordpress/wp-config.php


# Commande par défaut qui sera exécutée lors du lancement du conteneur
CMD ["./auto_config.sh"]
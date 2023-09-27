#!/bin/bash
# Pause de 10 secondes pour laisser le temps aux autres services de se démarrer
sleep 10
# Création du répertoire /run/php s'il n'existe pas déjà
mkdir -p /run/php

# Changement du répertoire courant vers le répertoire de Wordpress
cd /var/www/wordpress/

# Installation de Wordpress en utilisant WP-CLI
# La commande "wp core install" est utilisée pour effectuer l'installation initiale de Wordpress.
wp core install --allow-root \
    --url=${WP_URL} \
    --title=${WP_TITLE} \
    --admin_user=${WP_ADMIN_USER} \
    --admin_email=${WP_ADMIN_EMAIL} \
    --admin_password=${WP_ADMIN_PASSWORD}

# Création d'un nouvel utilisateur en utilisant WP-CLI
# La commande "wp user create" est utilisée pour créer un nouvel utilisateur avec le rôle "author".
wp user create --allow-root \
    ${WP_NEW_USER} \
    ${WP_EMAIL_NEW_USER} \
    --role=author \
    --user_pass=${WP_NEW_PWD}
# Démarrage de PHP-FPM (FastCGI Process Manager) sans passer en mode démon
/usr/sbin/php-fpm7.3 --nodaemonize
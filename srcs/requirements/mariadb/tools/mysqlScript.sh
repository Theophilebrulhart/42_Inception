#!/bin/bash
# Démarrage du service MariaDB
service mysql start;

# Attendre 5 secondes pour s'assurer que le service est démarré
sleep 5
# Création de la base de données si elle n'existe pas déjà
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -h localhost -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
# Création de l'utilisateur de la base de données s'il n'existe pas déjà
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -h localhost -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
# Attribution des privilèges à l'utilisateur sur la base de données
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -h localhost -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
# Modification du mot de passe de l'utilisateur root de MariaDB
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -h localhost -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
# Actualisation des privilèges
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -h localhost -e "FLUSH PRIVILEGES;"
# Arrêt propre du serveur MariaDB
mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" -h localhost shutdown
# Exécution de mysqld_safe pour démarrer le serveur MariaDB
exec mysqld_safe

<?php
// Informations de la base de données
define('DB_NAME', getenv('MYSQL_DATABASE'));
define('DB_USER', getenv('MYSQL_USER'));
define('DB_PASSWORD', getenv('MYSQL_PASSWORD'));
define('DB_HOST', getenv('MYSQL_HOSTNAME')); // Généralement 'localhost' fonctionne, mais vérifiez auprès de votre hébergeur si nécessaire.

// Définir la limite de mémoire PHP pour WordPress
define('WP_MEMORY_LIMIT', '256M');

// Désactiver les mises à jour automatiques
define('AUTOMATIC_UPDATER_DISABLED', false);

// Désactiver l'éditeur de thème et de plugin dans l'administration
define('DISALLOW_FILE_EDIT', true);


// Enregistrez les modifications
if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');

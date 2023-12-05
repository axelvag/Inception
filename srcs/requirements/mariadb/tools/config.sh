#!/bin/bash

# Create the WordPress database
# Ce script créer avec MySQL le système de table
# Lance mysql (start) puis applique mysql -u root(pour dire que je suis root) -e(pour specifier une cmd sql a exec) a chaque ligne du script
# GRANT ALL PRIV pour donner tous les droits a l'utilisateur
# FLUSH PRIVILEGES pour appliquer les changements

# Start the MariaDB service inside the Docker container
mysqld_safe &

sleep 10

mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"

# Stop the MariaDB server gracefully
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

mysqld_safe
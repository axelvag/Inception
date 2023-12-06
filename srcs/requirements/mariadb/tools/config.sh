#!/bin/bash

# Create the WordPress database
# Ce script créer avec MySQL le système de table
# Lance mysql (start) puis applique mysql -u root(pour dire que je suis root) -e(pour specifier une cmd sql a exec) a chaque ligne du script
# GRANT ALL PRIV pour donner tous les droits a l'utilisateur
# FLUSH PRIVILEGES pour appliquer les changements

# Lance le serveur MySQL de manière securisee en arrière-plan
mysqld_safe &

sleep 10

mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"

# Arrête le serveur MySQL de maniere securisee à l'aide de l'outil
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

# Redemarre le serveur MySQL en mode securise ce qui peut etre utile pour garantir que le serveur redemarre apres la configuration
mysqld_safe
#!/bin/bash

wp core download --allow-root

sleep 10

# echo "MYSQL_DATABASE: $MYSQL_DATABASE"
# echo "MYSQL_USER: $MYSQL_USER"
# echo "MYSQL_PASSWORD: $MYSQL_PASSWORD"
# echo "WORDPRESS_DB_HOST: $WORDPRESS_DB_HOST"
# echo "DOMAIN_NAME: $DOMAIN_NAME"
# echo "WORDPRESS_ADMIN_NAME: $WORDPRESS_ADMIN_NAME"
# echo "WORDPRESS_ADMIN_PASSWORD: $WORDPRESS_ADMIN_PASSWORD"
# echo "WORDPRESS_ADMIN_EMAIL: $WORDPRESS_ADMIN_EMAIL"
# echo "WORDPRESS_USER_NAME: $WORDPRESS_USER_NAME"
# echo "WORDPRESS_USER_EMAIL: $WORDPRESS_USER_EMAIL"
# echo "WORDPRESS_USER_PASSWORD: $WORDPRESS_USER_PASSWORD"

# Remplissage du formulaire
wp config create --dbname=$MYSQL_DATABASE \
                --dbuser=$MYSQL_USER \
                --dbpass=$MYSQL_PASSWORD \
                --dbhost=$WORDPRESS_DB_HOST \
                --dbprefix=wp_ --allow-root

# Installation de wordpress
wp core install --allow-root \
  --url="$DOMAIN_NAME" \
  --title="Inception" \
  --admin_user="$WORDPRESS_ADMIN_NAME" \
  --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
  --admin_email="$WORDPRESS_ADMIN_EMAIL"

# Cree un utilisateur
wp user create --allow-root \
  "$WORDPRESS_USER_NAME" "$WORDPRESS_USER_EMAIL" \
  --user_pass="$WORDPRESS_USER_PASSWORD" \
  --role=subscriber

# Mets les droit sur le dossier d'installation de wp
chown -R www-data:www-data /var/www/html/

# Lance php
/usr/sbin/php-fpm7.3 -F
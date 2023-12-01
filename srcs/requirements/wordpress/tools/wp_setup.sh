#!/bin/bash

# Check if WordPress is already installed
# if [ -f /var/www/html/wp-config.php ]
# then
#     echo "Wordpress already installer"
# else
    wp core download --allow-root

    sleep 10

    wp config create --dbname=$MYSQL_DATABASE \
                    --dbuser=$MYSQL_USER \
                    --dbpass=$MYSQL_PASSWORD \
                    --dbhost=$WORDPRESS_DB_HOST \
                    --dbprefix=wp_ --allow-root

    # Install WordPress
    wp core install --allow-root \
    --url="$DOMAIN_NAME" \
    --title="Inception" \
    --admin_user="$WORDPRESS_ADMIN_NAME" \
    --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
    --admin_email="$WORDPRESS_ADMIN_EMAIL"

    wp user create --allow-root \
    "$WORDPRESS_USER_NAME" "$WORDPRESS_USER_EMAIL" \
    --user_pass="$WORDPRESS_USER_PASSWORD" \
    --role=subscriber
# fi

  # Set appropriate permissions
chown -R www-data:www-data /var/www/html/

# Start PHP-FPM
/usr/sbin/php-fpm7.3 -F

# # on attend que mariaDb soit up
# sleep 10

# rm -rf /var/www/html/*

# # Download and install WordPress
# # if [ -f /var/www/html/wp-config.php ]
# # then
# # 	echo "Wordpress already installer"
# # else
# echo "Installing Wordpress"

# wp core download --allow-root --path=/var/www/html

# # on met le .env dans wordpress
# wp config create --dbname=$MYSQL_DATABASE \
#     --dbuser=$MYSQL_USER \
#     --dbpass=$MYSQL_PASSWORD \
#     --dbhost=$WORDPRESS_DB_HOST \
#     --dbprefix=wp_ --allow-root

# cat /var/www/html/wp-config.php

# # auto rempli la page de perso
# wp core install --allow-root \
# --url="$DOMAIN_NAME" \
# --title="Inception" \
# --admin_user="$WORDPRESS_ADMIN_NAME" \
# --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
# --admin_email="$WORDPRESS_ADMIN_EMAIL"

# wp user create --allow-root \
# "$WORDPRESS_USER_NAME" "$WORDPRESS_USER_EMAIL" \
# --user_pass="$WORDPRESS_USER_PASSWORD" \
# --role=subscriber

# # fi

# # Mets les droit sur le dossier d'installation de wp
# chown -R www-data:www-data /var/www/html/
# # Lance php-
# echo 'Starting php-fpm7.3'
# /usr/sbin/php-fpm7.3 -F

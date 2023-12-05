#!/bin/bash

# Check if WordPress is already installed
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

# Set appropriate permissions
chown -R www-data:www-data /var/www/html/

# Start PHP-FPM
/usr/sbin/php-fpm7.3 -F
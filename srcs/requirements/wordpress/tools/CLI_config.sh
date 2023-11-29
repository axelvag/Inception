# on attend que mariaDb soit up
sleep 10

# on met le .env dans wordpress
wp config create	--allow-root \
    --dbname=$MYSQL_DATABASE \
    --dbuser=$MYSQL_USER \
    --dbpass=$MYSQL_PASSWORD \
    --dbhost=mariadb:3306 --path='/var/www/wordpress'

# auto rempli la page de perso
wp core install

wp user create

# Mets les droit sur le dossier d'installation de wp
chown -R www-data:www-data /var/www/html/
# Lance php-
echo 'Starting php-fpm7.3'
/usr/sbin/php-fpm7.3 -F


# echo "== Installing and setting up Wordpress =="

# cd /var/www/html/wordpress

# # Download
# wp core download --path=/var/www/html/wordpress --allow-root

# # Create config file wp-config.php with the appropriate database parameters (these are env variables in the .env file)
# wp config create --path=/var/www/html/wordpress --allow-root --dbname=$DB_DATABASE --dbhost=$DB_HOST --dbprefix=wp_ --dbuser=$DB_USER_NAME --dbpass=$DB_USER_PASSWORD

# # Install wordpress for our website (again, variables are in the .env file)
# wp core install --path=/var/www/html/wordpress --allow-root --url=$DOMAIN_NAME --title="$WP_SITE_TITLE" --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL

# wp plugin update --path=/var/www/html/wordpress --allow-root --all

# # Create default user
# wp user create --path=/var/www/html/wordpress --allow-root $WP_USER_NAME $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD

# # Set the owner of the content of our site to www-data user and group
# # For security reasons, we want to restrict who has access to these files
# chown www-data:www-data /var/www/html/wordpress/wp-content/uploads --recursive

# mkdir -p /run/php/
# php-fpm7.3 -F



#!/bin/sh

#check if wp-config.php exist
# if [ -f ./wp-config.php ]
# then
# 	echo "wordpress already downloaded"
# else

# ####### MANDATORY PART ##########

# 	#Download wordpress and all config file
# 	wget http://wordpress.org/latest.tar.gz
# 	tar xfz latest.tar.gz
# 	mv wordpress/* .
# 	rm -rf latest.tar.gz
# 	rm -rf wordpress

# 	#Inport env variables in the config file
# 	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
# 	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
# 	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
# 	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
# 	cp wp-config-sample.php wp-config.php
# ###################################

# ####### BONUS PART ################

# ## redis ##

# 	wp config set WP_REDIS_HOST redis --allow-root #I put --allowroot because i am on the root user on my VM
#   	wp config set WP_REDIS_PORT 6379 --raw --allow-root
#  	wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
#   	#wp config set WP_REDIS_PASSWORD $REDIS_PASSWORD --allow-root
#  	wp config set WP_REDIS_CLIENT phpredis --allow-root
# 	wp plugin install redis-cache --activate --allow-root
#     wp plugin update --all --allow-root
# 	wp redis enable --allow-root

# ###  end of redis part  ###

# ###################################
# fi

# exec "$@"
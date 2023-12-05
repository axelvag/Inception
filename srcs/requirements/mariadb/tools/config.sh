#!/bin/bash

# Start the MariaDB service inside the Docker container
mysqld_safe &

sleep 10

# Create the WordPress database
mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"

# Create the MySQL user for WordPress
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

# Grant privileges to the WordPress user on the WordPress database
mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

# Flush privilegess
mysql -e "FLUSH PRIVILEGES;"

# Stop the MariaDB server gracefully
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

# Start the MariaDB service inside the Docker container
mysqld_safe
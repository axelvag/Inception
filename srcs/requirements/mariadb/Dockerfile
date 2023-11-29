FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt update && \
    apt install dumb-init curl less -y

RUN apt update && \
    apt install -y mariadb-server


COPY tools/mariadb.sh /mariadb.sh

RUN chmod +x /mariadb.sh

RUN mkdir -p /Users/avaganay/data/mariadb

ENTRYPOINT ["/mariadb.sh"]
    
EXPOSE 3306


# Utilisation de l'image officielle de MariaDB depuis Docker Hub
# FROM mariadb:latest

# Optionnel : Définir des variables d'environnement pour MariaDB
# ENV MYSQL_ROOT_PASSWORD=my-secret-pw
# ENV MYSQL_DATABASE=mydatabase
# ENV MYSQL_USER=myuser
# ENV MYSQL_PASSWORD=mypassword

# Optionnel : Copier des scripts SQL pour les exécuter lors de l'initialisation de la base de données
# COPY ./scripts/ /docker-entrypoint-initdb.d/

# Exposer le port MySQL par défaut (3306)
# EXPOSE 3306

# CMD est défini dans l'image officielle MariaDB pour démarrer le serveur MySQL
# Vous pouvez également ajouter des options de configuration ici si nécessaire

# Exemple : CMD ["mysqld", "--character-set-server=utf8mb4", "--collation-server=utf8mb4_unicode_ci"]



# Crée le répertoire sur le conteneur
# Ce script créer avec MySQL le système de table
# Lance mysql (start) puis applique mysql -u root(pour dire que je suis root) -e(pour specifier une cmd sql a exec) a chaque ligne du script
# GRANT ALL PRIV pour donner tous les droits a l'utilisateur
# FLUSH PRIVILEGES pour appliquer les changements

# RUN service mysql start \
#     && mysql -u root -e \
#     "CREATE DATABASE IF NOT EXISTS $DB_DATABASE; \
#     ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD'; \
#     GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASSWORD'; \
#     FLUSH PRIVILEGES;"



# RUN mkdir -p /Users/avaganay/data/mariadb

# Remplacez les valeurs 1000:1000 par votre ID utilisateur et groupe local
# ARG USER_ID=1000
# ARG GROUP_ID=1000

# # Définit les propriétaires du répertoire dans le conteneur
# RUN chown -R ${USER_ID}:${GROUP_ID} /var/lib/mysql


# RUN mkdir -p /Users/avaganay/data/mariadb

# RUN chown -R avaganay:avaganay /Users/avaganay/data/mariadb

# RUN mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
# RUN exec mysqld_safe

# COPY conf/mariadb.conf	/etc/mysql/mariadb.conf.d/mariadb.conf

# RUN chmod 755 /etc/mysql/mariadb.conf.d/mariadb.conf

# ENTRYPOINT ["/etc/mysql/mariadb.conf.d/mariadb.conf"]


# CMD ["mysqld", "--bind-address=0.0.0.0" ]

# Configuration de l'entrée du conteneur
# ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# Commande par défaut
# CMD ["/mariadb.sh"]
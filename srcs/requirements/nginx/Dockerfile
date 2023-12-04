FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y

#installer tout les paquets necessaires en une seule commande
RUN apt update && \
    apt install -y nginx vim curl openssl
#    rm -rf /var/lib/apt/lists/*

#avoir le certificat ssl, -x509 pour certificat auto-signé, -newkey pour générer une nouvelle clé privée rsa, -nodes pour ne pas crypter la clé privée
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Lyon/O=42/OU=42/CN=avaganay.42.fr/UID=avaganay"

#mettre le fichier de configuration nginx.conf dans le container
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

# accorde les droits d'écriture, lecture et exec sur le dossier html
RUN chmod 777 /var/www/html
# donne les droits au groupe www-data
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

# lance le serveur nginx
CMD [ "nginx", "-g", "daemon off;" ]

# FROM debian:buster

# RUN apt-get update && apt-get install -y \
#      nginx
# RUN apt install openssl -y

# COPY ./conf/nginx.conf  /etc/nginx/sites-available/default

# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
#      -keyout /etc/ssl/private/cert_key.key \
#      -out /etc/ssl/certs/cert_key.crt \
#      -subj "/C=FR/ST=RHONE/L=LYON/O=42 Lyon/OU=42/CN=jlaisne.42.fr/UID=jlaisne"

# RUN chmod 777 -R /var/www/html

# EXPOSE 443

# CMD ["nginx", "-g", "daemon off;"]

FROM debian:buster

RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

#avoir le certificat ssl, -x509 pour certificat auto-signé, -newkey pour générer une nouvelle clé privée rsa, -nodes pour ne pas crypter la clé privée
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=FR/ST=RHONE/L=LYON/O=42 lyon/OU=42/CN=avaganay.42.fr/UID=avaganay"

# mettre le fichier de configuration nginx.conf dans le container
COPY ./conf/nginx.conf /etc/nginx/sites-available/default
# accorde les droits d'écriture, lecture et exec sur le dossier html
RUN chmod 777 -R /var/www/html

EXPOSE 443

# lance le serveur nginx
CMD [ "nginx", "-g", "daemon off;" ]
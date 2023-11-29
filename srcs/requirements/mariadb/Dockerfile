# FROM mariadb:latest

# EXPOSE 3306

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

.PHONY: all build rebuild stop stop volumes fclean

all: volumes build up

build:
		sudo docker-compose -f srcs/docker-compose.yml --env-file srcs/.env build

up:
		sudo docker-compose -f srcs/docker-compose.yml --env-file srcs/.env up 

stop:
		sudo docker-compose -f srcs/docker-compose.yml --env-file srcs/.env stop
volumes:
		sudo mkdir -p /home/jlaisne/data/wordpress
		sudo mkdir -p /home/jlaisne/data/mariadb

fclean:
		sudo docker-compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans
		sudo rm -rf /home/jlaisne/data/wordpress
		sudo rm -rf /home/jlaisne/data/mariadb

rebuild:
		sudo docker-compose -f srcs/docker-compose.yml --env-file srcs/.env build --no-cache

re: fclean rebuild all
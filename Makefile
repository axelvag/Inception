.phony : setup stop start re log clean build rebuild

all : setup start

DOCKER_COMPOSE = docker compose
DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

setup :
	@echo "----Setup Docker-----------"

stop :
	@echo "----Stopping all Docker----"
	sudo $(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) stop
	@echo "----All Docker stopped-----"

build :
	@echo "----Building all Docker----"
	sudo mkdir -p /home/avaganay/data/wordpress
	sudo mkdir -p /home/avaganay/data/mariadb
	sudo $(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) build
	@echo "----All Docker built-------"

start : build
	@echo "----Starting all Docker----"
	sudo $(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d
	@echo "----All Docker started-----"

clean :
	@echo "----Cleaning all Docker----"
	sudo $(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down --rmi all --remove-orphans
	sudo rm -rf /home/avaganay/data/wordpress
	sudo rm -rf /home/avaganay/data/mariadb
	@echo "----All Docker cleaned-----"

log :
	@echo "----Status Docker----------"
	sudo docker ps

rebuild :
	@echo "----Rebuilding all Docker----"
	sudo $(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) build --no-cache

re : clean rebuild start
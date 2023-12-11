# Inception

![image](image/image.png)

# My first Docker project !!

This project aims to broaden my knowledge of system administration by using Docker. I had to virtualize several Docker images, creating them in my new personal virtual machine (Oracle VM VirtualBox).

## How

I use:

<b>WORDPRESS</b>
> for my front-end website

<b>MARIADB</b>
> for my back-end data base

<b>NGINX</b>
> for my server

# STARTING

```bash
# clone this repo
$ git clone https://github.com/axelvag/Inception Inception

# enter
$ cd Inception

# Compile this project
$ make

# Wait 1 min 30 to have:
nginx: success
mariadb: success
wordpress: success

# then open Google and search https://localhost:443
# localhost = 127.0.0.1

```

## Subject's requests

Each Docker image must have the same name as its corresponding service.

Each service has to run in a dedicated container.

For performance matters, the containers must be built either from the penultimate stable version of Alpine or Debian. The choice is yours.

You also have to write your own Dockerfiles, one per service. The Dockerfiles must be called in your docker-compose.yml by your Makefile.

It means you have to build yourself the Docker images of your project. It is then for- bidden to pull ready-made Docker images, as well as using services such as DockerHub (Alpine/Debian being excluded from this rule).

You then have to set up:

• A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.

• A Docker container that contains WordPress + php-fpm (it must be installed 
and configured) only without nginx.

• A Docker container that contains MariaDB only without nginx.

• A volume that contains your WordPress database.

• A second volume that contains your WordPress website files.

• A docker-network that establishes the connection between your containers. Your containers have to restart in case of a crash.

## Some knowledge

- Docker: is a containerization technology that makes application deployment faster and easier.

- Container: is a virtual machine without kernel = image.

- Docker Hub : like Github, containing images (containers) of thousands of people simplifying use even further.

- Dockerfile: file which contains a series of instructions used to create an image, to be able to launch containers.
    - **FROM** : know what OS our machine is on
    - **RUN** : launch an order
    - **COPY** : copy from one place to another, as simple as that
    - **EXPOSE** : exposes the specified port and makes it available only for inter-container communication 
    - **ENTRYPOINT** : run the script

- Docker-compose: Like a Makefile: Orchestrates docker, it manages dependencies and is used to share multi-container applications
(allows you to compile the other Dockerfiles of other images)

- The difference between a Docker image used with docker compose and without docker compose:
  > Without docker-compose, it's as if there was no Makefile, you have to build the containers one by one without wrong order for dependencies for example

- The benefit of Docker compared to VMs :
    - Dockers share the same OS kernel so faster to install and everything
    - Dockers encapsulate an application and its dependencies, guaranteeing portability between different computers
    - They have simplified deployment with Kubernetes for example
   
- Volumes: 
    - **PERSISTANCE**: Used to persist and share data, unlike data stored in containers.
    - **Independance**: Volumes are managed by Docker and are separate from containers. This means that data in volumes is not affected when you update or redeploy a container.

    = A means to store and manage data.

- Docker-network: is a concept facilitating communication between containers and the external world, employing default bridges for intra-container communication and enabling port mapping for external access.
  
    - <Bridge : The default network for containers, used for communication on a single Docker host. It allows containers to communicate with each other and connect to the external network via the host server.>
    
    - port-mapping: Making a container's ports accessible from outside the container. Port mapping is essential for Docker container networking, enabling access to services and applications running in these containers from the outside.

{
    In the docker-compose.yml: In summary, in this nginx service, the container's port 443 is mapped to the host's port 443, allowing access to the nginx web server from the outside on the standard HTTPS port. Dependencies, volumes, and the network are also configured to ensure proper interaction with other services, including WordPress.
}

**SSL and TLS**
    - SSL and TLS are two protocols that allow authentication and encryption of data transmitted between servers.


------------------------------------------------------

** Difference between a Docker image used with Docker-compose and without Docker-compose:

    - Without:
        - Individual commands
        - configurations manuelle
        - Gestion isole

    - With:
        - Fichier de configuration
        - Orchestration de plusieur conteneur
        - Demarrage et arret coherant
        - Reseaux et communication inter-conteneur

In summary, the difference is not in the image itself but rather in how they are managed and configured.

** Docker offers several advantages over virtual machines (VMs), especially in terms of efficiency, lightweight, and speed. 

    - Resource Efficiency:
        - Docker:  Uses fewer resources as containers share the same kernel.
        - VMs: Each VM runs with its own OS, requiring more resources.

    - Quick Start for Docker compared to VMs

    - Portability:
        - Docker: Easily movable to another environment
        - VMs: Less flexible.


In summary, resource efficiency, flexibility, and rapid deployment.


docker exec -it mariadb mariadb
SHOW tables;
SELECT * FROM name_of_table;

docker stop $(docker ps -qa) ; docker rm $(docker ps -qa) ; docker rmi -f $(docker images -qa) ; docker volume rm $(docker volume ls -q) ; docker network rm $(docker network ls -q) 2>/dev/null

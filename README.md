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

## Subject's requests

Each Docker image must have the same name as its corresponding service.
Each service has to run in a dedicated container.
For performance matters, the containers must be built either from the penultimate stable version of Alpine or Debian. The choice is yours.
You also have to write your own Dockerfiles, one per service. The Dockerfiles must be called in your docker-compose.yml by your Makefile.
It means you have to build yourself the Docker images of your project. It is then for- bidden to pull ready-made Docker images, as well as using services such as DockerHub (Alpine/Debian being excluded from this rule).
You then have to set up:
• A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
• A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.
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
    - **ENTRYPOINT** : lance le script

- Docker-compose: Comme un Makefile: Orchestre les docker, il gere les dependances et sert a partager des application multi-conteneurs
(permet de faire compiler les autre Dockerfile des autre images)

- The difference between a Docker image used with docker compose and without docker compose:
  > Sans docker-compose, c'est comme s'il n'y avais pas de Makefile, il faut build les conteneur un a un sans ce tromper d'ordre pour les dependances par exemple

- The benefit of Docker compared to VMs :
    - Les docker partagent le meme noyau OS donc plus rapide a installer et tout
    - Les docker encapsulent une application et ses dependances, garantissant une portabilite entre differents ordinateurs
    - Ils ont des deploiement simplifier avec kubernetes par exemple
   
- Volumes: 
    - **PERSISTANCE**sont utilise pour persister et partager les donnes contrairement aux donnes stocker dans les conteneurs
    - **Independance**: Les volumes sont gérés par Docker et sont séparés des conteneurs. Cela signifie que les données dans les volumes ne sont pas affectées lorsque vous mettez à jour ou redéployez un conteneur.

    = moyen de stocker et gerer les donnes.

- Docker-network: est un concept dans Docker qui permet de definir et de gerer les communication entre les conteneur et le monde exterieur.
    - <Bridge : Le réseau par défaut pour les conteneurs, utilisé pour la communication sur un seul hôte Docker. Il permet à des conteneurs de se parler et de se connecter au réseau externe via le serveur hôte.>
    
    - port-mapping: rendre les ports d'un conteneurs accessibles de l'exterieur du conteneurs.
    Le port mapping est donc un élément essentiel pour la mise en réseau des conteneurs Docker, permettant l'accès aux services et applications exécutés dans ces conteneurs depuis l'extérieur.

{
    Dans le docker-compose.yml: En résumé, dans ce service nginx, le port 443 du conteneur est mappé sur le port 443 de l'hôte, permettant ainsi d'accéder au serveur web nginx depuis l'extérieur sur le port HTTPS standard. Les dépendances, les volumes et le réseau sont également configurés pour assurer une interaction appropriée avec les autres services, notamment WordPress.
}

**SSL et TLS**
    - SSL et TLS sont deux protocoles qui permettent l’authentification, et le chiffrement des données qui transitent entre des serveurs.


------------------------------------------------------

** Difference entre une image Docker utilise avec Docker-compose et sans Docker-compose:

    - Sans:
        - Commandes individuelles
        - configurations manuelle
        - Gestion isole

    - Avec:
        - Fichier de configuration
        - Orchestration de plusieur conteneur
        - Demarrage et arret coherant
        - Reseaux et communication inter-conteneur

En resume, la difference n'est pas dans l'image elle - meme mais plutot la maniere dont elles sont gerer et configurer.

** Docker offre plusieurs avantages par rapport aux machines virtuelles (VMs), en particulier en termes d'efficacité, de légèreté et de rapidité. 

    - Efficacité des Ressources
        - Docker: utilise moins de ressource car les conteneurs utilise le meme noyau
        - VMs: Chaque Vms fonctionne avec son propre OS donc requiert plus de ressource

    - Demarrage Rapide pour Docker comparer au vms

    - Portabilite
        - Docker: facilement deplacable dans un autre environnment 
        - Vms: moins flexibles

    .....

En resume,  efficacité des ressources, une flexibilité, et une rapidité de déploiement.

docker exec -it mariadb mariadb
SHOW tables;
SELECT * FROM name_of_table;

docker stop $(docker ps -qa) ; docker rm $(docker ps -qa) ; docker rmi -f $(docker images -qa) ; docker volume rm $(docker volume ls -q) ; docker network rm $(docker network ls -q) 2>/dev/null

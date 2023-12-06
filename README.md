# Inception

- DOCKER: est une techno de conteneurisation qui rend le deploiement d'application plus rapide, et plus facile

- conteneur: est une machine virtuelle sans noyau = image

- Docker Hub : app store, contenant des images(conteneurs) de millier de personnes simplifiant encore plus l'usage.

- Dockerfile: fichier qui contient une serie d'instruction utilise pour cree un image, pour pouvoir lance des conteneurs.
    - **FROM** : savoir sur quel OS est notre machine
    - **RUN** : lance une commande
    - **COPY** : copie aussi simple que ca
    - **EXPOSE** : expose le port spécifié et le rend disponible uniquement pour la communication entre conteneurs. 
    - **ENTRYPOINT** : lance le script

- Docker-compose: partager des application multi-conteneurs
(permet de faire compiler les autre Dockerfile des autre images)

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

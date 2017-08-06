docker stop pat
docker rm pat
docker run --name pat -v $PWD/apps:/var/www/html -p 80:80 -h lemp -d pat:latest
docker exec -ti pat bash
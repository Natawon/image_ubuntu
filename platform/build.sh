#!/bin/bash
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker stop pat
docker rm pat
docker rmi pat
docker build -t pat .
docker run --name pat -v $PWD/apps:/var/www/html -p 8081:8081 -h lemp -d pat:latest
docker exec -ti pat bash


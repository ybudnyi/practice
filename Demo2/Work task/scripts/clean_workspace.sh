#!/bin/bash
docker-compose stop 
docker-compose rm -f
docker volume rm $(docker volume ls -q)
#docker network rm $(docker network ls -q)
docker image rm $(docker image ls -q) -f
echo "Cleaned workspace"
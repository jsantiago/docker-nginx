#!/bin/bash

REPO="docker-nginx"
MOUNT="$PWD/public:/var/www"
HOST_PORT=8080
CONTAINER_PORT=80

# Build
docker build -rm -t $REPO .

# Run
docker run -p $HOST_PORT:$CONTAINER_PORT -v $MOUNT -i -t $REPO

# Remove stopped containers
CONTAINERS=$(docker ps  -a | grep 'Exit' | awk '{print $1}')
if [[ -n $CONTAINERS ]]; then
    docker rm $CONTAINERS
fi

# Remove untagged images
IMAGES=$(docker images | grep "^<none>" | awk '{print $3}')
if [[ -n $IMAGES ]]; then
    docker rmi $IMAGES
fi

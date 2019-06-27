#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-godlikeproductspay/godlikeproductsd-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/godlikeproductsd docker/bin/
cp $BUILD_DIR/src/godlikeproducts-cli docker/bin/
cp $BUILD_DIR/src/godlikeproducts-tx docker/bin/
strip docker/bin/godlikeproductsd
strip docker/bin/godlikeproducts-cli
strip docker/bin/godlikeproducts-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker

#!/bin/bash
APP_NAME="mergerfs"
IMAGE_TAG="$APP_NAME-build"
BUILD_PATH="/tmp/build"

mkdir $BUILD_PATH
cd $BUILD_PATH
docker build -t $IMAGE_TAG .
ID=$(docker create $IMAGE_TAG)
docker cp $ID:/build/ .
docker rm -v $ID
docker rmi $IMAGE_TAG

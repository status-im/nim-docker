#!/bin/sh

set -ev

buildAndPush() {
    cp bootstrap.sh $1
    docker build -t statusteam/$1 $1
#    docker push statusteam/$1
    rm $1/bootstrap.sh
}

if [ "$1" = "all" -o "$BUILD_ALL" = "true" ]
then
    buildAndPush debian-pre-nim
fi
docker run --rm --privileged multiarch/qemu-user-static:register
#buildAndPush nim-base
buildAndPush nim-base-arm32v7
#buildAndPush nim-base-arm64v8

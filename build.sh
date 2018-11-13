#!/bin/sh

set -ev

buildAndPush() {
    docker build -t statusteam/$1 $1
#    docker push statusteam/$1
    rm $1/bootstrap.sh $1/qemu-*-static
}

buildAndPushArch() {
    # Copy template to temporary dir, make substitutions and run docker build
    BASE=$1
    DIR=tmp-$BASE
    TAG=nim-base:$BASE
    ARCH=$2

    echo "Setting up $DIR for $ARCH"
    mkdir -p $DIR
    cp bootstrap.sh /usr/bin/qemu-$ARCH-static $DIR
    cp Dockerfile.arch $DIR/Dockerfile
    sed -i s/BASE/$BASE/ $DIR/Dockerfile
    sed -i s/ARCH/$ARCH/ $DIR/Dockerfile
    docker build -t statusteam/$TAG $DIR
#    docker push statusteam/$TAG
    rm -rf $DIR
}

if [ "$1" = "all" -o "$BUILD_ALL" = "true" ]
then
    buildAndPush debian-pre-nim
fi

#buildAndPush nim-base
#buildAndPushArch arm32v7 arm
buildAndPushArch arm64v8 aarch64


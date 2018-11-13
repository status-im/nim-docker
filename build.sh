#!/bin/sh

set -ev

buildAndPush() {
    docker build -t statusteam/$1 $1
#    docker push statusteam/$1
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

if [ "$BASE" = "" -o "$ARCH" = "" ]; then
  buildAndPush nim-base
else
  buildAndPushArch $BASE $ARCH
fi



set -ev

buildAndPush() {
    docker build -t statusteam/$1 $1
    docker push statusteam/$1
}

if [ "$1" = "all" -o "$BUILD_ALL" = "true" ]
then
    buildAndPush debian-pre-nim
fi

buildAndPush nim-base

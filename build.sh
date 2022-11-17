#!/bin/bash

orange=`tput setaf 3`
reset_color=`tput sgr0`

ARCH=`uname -m`

BASE_PATH=$(cd ./"`dirname $0`" || exit; pwd)
cd $BASE_PATH

docker build . \
    -f $BASE_PATH/Dockerfile \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g) \
    -t kaggle-api
#!/bin/bash

if [ $# != 1 ]; then
  echo "Usage: 
        bash start.sh [SHARED_DIR]
       "
  exit 1
fi

get_real_path(){
  if [ "${1:0:1}" == "/" ]; then
    echo "$1"
  else
    realpath -m "$PWD"/"$1"
  fi
}

SHARED_DIR=$(get_real_path "$1")

if [ ! -d $SHARED_DIR ]
then
    echo "error: SHARED_DIR=$SHARED_DIR is not a directory."
exit 1
fi

ARCH=`uname -m`

orange=`tput setaf 3`
reset_color=`tput sgr0`

BASE_PATH=$(cd ./"`dirname $0`" || exit; pwd)
cd $BASE_PATH

docker run -it -d --rm \
    --privileged \
    --name ${USER}_kaggle_api \
    --net host \
    -v /home/$USER/.kaggle:/home/docker_kaggle/.kaggle:ro \
    -v $SHARED_DIR/:/home/docker_kaggle/Shared:rw \
    kaggle-api
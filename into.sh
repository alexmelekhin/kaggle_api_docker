#!/bin/bash

docker exec --user "docker_kaggle" -it ${USER}_kaggle_api \
    /bin/bash -c "cd /home/docker_kaggle; echo ${USER}_kaggle_api container; echo ; /bin/bash"
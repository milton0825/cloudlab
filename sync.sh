#!/bin/bash

source .env

project_name=$1



echo "Syncing $project_name"

rsync -rzP --delete ${LOCAL_BASE_PATH}/${project_name} ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_BASE_PATH}

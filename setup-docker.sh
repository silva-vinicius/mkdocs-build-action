#!/bin/bash

# Get the python version passed as an argument
python_version=$1

# Pull the corresponding python Docker image
docker pull python:$python_version-buster

# Run a container with the pulled image
container_id=$(docker run -d -it -v $(pwd)/public:/public python:$python_version-buster)

echo "container_id=$container_id" >> $GITHUB_OUTPUT
echo "built_dir=public" >> $GITHUB_OUTPUT

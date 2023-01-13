#!/bin/bash

# Get the python version passed as an argument
python_version=$1

# Pull the corresponding python Docker image
docker pull python:$python_version-buster

# Run a container with the pulled image
container_id=$(docker run -d -it -v $(pwd)/public:/public python:$python_version-buster)

touch super_file.txt

docker cp build-docs.sh $container_id:/build-docs.sh

docker exec $container_id /bin/bash -c 'chmod +x /build-docs.sh; /build-docs.sh'

echo "built_dir=public" >> $GITHUB_OUTPUT

# The folder my_folder is now accessible inside the container
ls
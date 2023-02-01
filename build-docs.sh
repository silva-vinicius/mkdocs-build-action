#!/bin/sh

set -x # verbose mode
set -e # stop executing after error

echo "Starting mkdocs build"

docs_path=$1

####################################################
# Build the Mkdocs site
####################################################

pip install --quiet --no-cache-dir mkdocs mkapi
pip install -r requirements.txt
pip install mkdocs-minify-plugin>=0.2

cd $docs_path && mkdocs build -d public

####################################################
# Build completed
####################################################

echo "Completed mkdocs build"
echo "built_dir=public" >> $GITHUB_OUTPUT
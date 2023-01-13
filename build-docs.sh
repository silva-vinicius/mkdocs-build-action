#!/bin/sh

set -x # verbose mode
set -e # stop executing after error

echo "Starting mkdocs build"

####################################################
# Build the Mkdocs site
####################################################

pip install --quiet --no-cache-dir mkdocs mkapi
pip install -r requirements.txt
pip install mkdocs-minify-plugin>=0.2

mkdocs build -d public

####################################################
# Build completed
####################################################

echo "Completed mkdocs build"

#!/bin/bash

set -ueo pipefail

: ${APP:='logstash-forwarder'}

# cd to the current directory so the script can be run from anywhere.
cd `dirname "$0"`

# Update the certificates.
echo "Updating certificates..."
./certs/update.sh

docker build -f Dockerfile.build -t $APP-builder .

# Create a dummy container so we can run a cp against it.
ID=$(docker create $APP-builder)

# Update the local binary.
docker cp $ID:/go/bin/$APP .

# Cleanup.
docker rm -f $ID
docker rmi $APP-builder

# Update the local image.
docker build -f Dockerfile.scratch -t $APP .

echo "Done."

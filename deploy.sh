#!/bin/bash
set -e

VERSION=$(./get_version.sh)
export VERSION
echo "DEPLOYING version $VERSION"

echo "Starting stack"
docker stack deploy --compose-file docker-compose.yml simple-elastic-kibana

echo "Cleaning old containers"
docker ps | grep "simple-elastic-kibana_" | cut -d' ' -f1 | xargs docker rm -f
#! /bin/bash

# $DOCKER_IMG_PROTOC is set in .travis.yml
exec docker run --rm \
     -v /tmp:/tmp \
     -u $(id -u) \
     "$DOCKER_IMG_PROTOC" "$@"

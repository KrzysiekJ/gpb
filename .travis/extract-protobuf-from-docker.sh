#! /bin/bash

set -xv


dest="$1"

cat > "$dest"/copy-it.sh <<EOF
#! /bin/sh

mkdir -p /d/include/google
mkdir -p /d/lib
cp -p -d -r /usr/include/google/protobuf  /d/include/google
cp -p -d /usr/lib/libprotobuf*            /d/lib
EOF
chmod +x "$dest"/copy-it.sh

# $DOCKER_IMG_PROTOC is set in .travis.yml
docker run --rm \
       --entrypoint='/d/copy-it.sh' \
       -v "$dest":/d \
       -u $(id -u) \
       -w /d \
       "$DOCKER_IMG_PROTOC"

#/bin/rm "$dest"/copy-it.sh

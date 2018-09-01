#! /bin/bash

set -ex
vsn="$1"
dest="$2"
wget https://github.com/protocolbuffers/protobuf/releases/download/v$vsn/protobuf-cpp-$vsn.tar.gz
tar xfpz protobuf-cpp-$vsn.tar.gz
cd protobuf-$vsn && ./configure --prefix="$dest" && make && make install

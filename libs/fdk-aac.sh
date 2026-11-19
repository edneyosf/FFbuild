#!/bin/bash

REPOSITORY="https://github.com/mstorsjo/fdk-aac.git"
BRANCH="v3.0.0"

cd $SOURCES_DIR
git clone --branch $BRANCH --depth 1 $REPOSITORY
cd fdk-aac
autoreconf -fiv
./configure --prefix=$BUILD_DIR --disable-shared --enable-static --with-pic --disable-example
make -j $(nproc)
make install
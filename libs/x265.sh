#!/bin/bash

REPOSITORY="https://bitbucket.org/multicoreware/x265_git.git"
BRANCH="stable"

cd $SOURCES_DIR
git clone --branch $BRANCH --depth 1 $REPOSITORY
cd x265_git/build/linux
cmake -DCMAKE_INSTALL_PREFIX=$BUILD_DIR -DCMAKE_BUILD_TYPE=Release -DENABLE_SHARED=off -DENABLE_CLI=OFF -DHIGH_BIT_DEPTH=ON -DENABLE_HDR10_PLUS=ON ../../source
make -j $(nproc)
make install
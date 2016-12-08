#!/bin/sh
set -xe

PLATFORM="$1"
pwd
cd "ci/$PLATFORM"

(cd ../../.. && ./autogen.sh)
../../../configure
make
make distcheck

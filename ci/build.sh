#!/bin/sh
set -xe

PLATFORM="$1"
pwd
cd "ci/$PLATFORM"

if [ ! -f Makefile ]; then
	(cd ../../.. && ./autogen.sh)
	../../../configure
fi
make

make check

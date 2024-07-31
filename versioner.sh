#!/usr/bin/env bash
VERSION=$( python3 genversion.py )

echo $VERSION $( git rev-parse HEAD ) >> history.txt

perl -C -i -p -e "s/(\\\$Version:).*(:\\\$)/\\1${VERSION}\\2/" titre_md

./mkdoc.sh 

#!/bin/bash
VERSION=`dpkg-parsechangelog --show-field Version | cut -f1 -d"-"`
HASH=`echo $REVISION | cut -c1-10`
dch -b -M -v "$VERSION-$GITHUB_RUN_ID~$GITHUB_SHA~`lsb_release -cs`" --force-distribution -D "`lsb_release -cs`" "Nightly build, $GITHUB_SHA" 
debuild -b -us -uc 
ls -la ..

mkdir -p $GITHUB_WORKSPACE
mv ../*.deb $GITHUB_WORKSPACE
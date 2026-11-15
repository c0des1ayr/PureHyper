#!/usr/bin/env bash
# this damn engine needs zips with no sparse files ("holes" in DOOM-speak), so I can't use bsdtar
NAME="VL_PureHyper"
VERSION="$(git describe --tags)"
ADDONFILE="$NAME-$VERSION.pk3"
TMPDIR=$(mktemp -d)
WORKDIR=$PWD
pushd files
tar -cvf - . | tar -xf - -C $TMPDIR
popd
pushd $TMPDIR
zip -r $ADDONFILE .
mv $ADDONFILE $WORKDIR
popd
rm -rf $TMPDIR

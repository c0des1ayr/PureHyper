#!/usr/bin/env bash
# this damn engine needs zips with no sparse files, so I can't use bsdtar
ADDONFILE="VL_PureHyper_v0.0.2.pk3"
TMPDIR=$(mktemp -d)
WORKDIR=$PWD
pushd files
tar -cvf - . | tar -xf - -C $TMPDIR
popd
pushd $TMPDIR
zip -r $ADDONFILE .
rm -f $WORKDIR/../../addons/$ADDONFILE
mv $ADDONFILE $WORKDIR/../../addons
popd
rm -rf $TMPDIR

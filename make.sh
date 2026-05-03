#!/usr/bin/env bash
# this damn engine needs zips with no sparse files, so I can't use bsdtar
TMPDIR=$(mktemp -d)
WORKDIR=$PWD
pushd files
tar -cvf - . | tar -xf - -C $TMPDIR
popd
pushd $TMPDIR
zip -r VL_PureHyper_v0.0.2.pk3 .
mv VL_PureHyper_v0.0.2.pk3 $WORKDIR
popd
rm -rf $TMPDIR

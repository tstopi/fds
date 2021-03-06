#!/bin/bash

CURDIR=`pwd`
platform="linux"
if [ "`uname`" == "Darwin" ]; then
  platform="osx"
fi
cd $platform

echo making bundle for $platform

echo -------------------------------------------------
echo -------------building fds------------------------
echo -------------------------------------------------
./make_fds.sh
echo -------------------------------------------------
echo --- building smokeview and associated programs --
echo -------------------------------------------------
./make_smv.sh
echo -------------------------------------------------
echo -------getting fds pubs -------------------------
echo -------------------------------------------------
./get_fds_pubs.sh
echo -------------------------------------------------
echo -------getting smokeview pubs -------------------
echo -------------------------------------------------
./get_smv_pubs.sh
echo -------------------------------------------------
echo ------- making the bundle -----------------------
echo -------------------------------------------------
./make_bundle.sh
echo -------------------------------------------------
echo ------- complete --------------------------------
echo -------------------------------------------------

cd $CURDIR

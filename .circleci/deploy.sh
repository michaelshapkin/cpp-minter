#!/usr/bin/env bash
set -e
set -x
VERS=`git rev-parse --short HEAD`
if [ -f "version" ]
then
    VERS=`cat version | tr -d "\n"`
fi

if [ -f "../version" ]
then
    VERS=`cat ../version | tr -d "\n"`
fi

if [ "${1}" != "" ]
then
    VERS=${1}
fi

## Deploy in latest channel
conan create . minter/latest
conan export-pkg . minter_tx/${VERS}@minter/latest -f
conan upload minter_tx/${VERS}@minter/latest --all -r=minter
#!/bin/sh

pushd setup
./wait.sh
./storage.sh
./git.sh
./populator.sh
popd

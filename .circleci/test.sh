#!/usr/bin/env bash

set -e

mkdir -p _build && cd _build
cmake .. -DCMAKE_BUILD_TYPE=Debug -DMINTER_TX_TEST=On
cmake --build . --target minter_tx-test
./bin/minter_tx-test
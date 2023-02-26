#!/bin/bash

set -e

set -v

export PATH=$DEPOT_TOOLS:$PATH

export TARGETS="webrtc libjingle_peerconnection"
if [[ "$(uname)" == "Linux" && "$TARGET_ARCH" == arm* ]]; then
  export TARGETS="$TARGETS pc:peerconnection libc++ libc++abi"
fi
if [[ "$(uname)" == "Darwin" ]]; then
  export TARGETS="$TARGETS libc++"
fi

if [ -z "$PARALLELISM" ]; then
  ninja $TARGETS -j 2
else
  ninja $TARGETS -j 2
fi

#!/usr/bin/env -S bash -xv
if [[ ! -d stubs ]]; then
  echo "Must run from the root of this project (where stubs is a subdirectory)"
  exit 1
fi

if [[ $(uname) == CYGWIN* ]] ; then
  T="cygpath -w"
else
  T=echo
fi

# DOCKER_TAG=phan-stubs-builder/7.1-cli
DOCKER_TAG=phan-stubs-builder:local
docker build -t $DOCKER_TAG -f .docker/Dockerfile .docker
docker run -v "$($T $PWD/stubs)":/phan_stubs/ -v "$($T $PWD/.docker)":/scripts:ro -e /bin/bash $DOCKER_TAG /scripts/generate_stubs_worker.sh

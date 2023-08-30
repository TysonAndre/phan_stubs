#!/usr/bin/env -S bash
PHPV=$1
PHPV=${PHPV:=7.1}
if [[ ! -d stubs ]]; then
  echo "Must run from the root of this project (where stubs is a subdirectory)"
  exit 1
fi

if [[ $(uname) == CYGWIN* ]] ; then
  T="cygpath -w"
else
  T=echo
fi

DOCKER_TAG=phan-stubs-builder:$PHPV

docker build -t $DOCKER_TAG -f .docker/Dockerfile --build-arg PHPV=$PHPV .docker || exit -1
docker run --rm -v "$($T $PWD/stubs)":/phan_stubs/ -v "$($T $PWD/.docker)":/scripts:ro -e /bin/bash $DOCKER_TAG /scripts/generate_stubs_worker.sh

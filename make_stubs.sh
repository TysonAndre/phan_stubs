#!/usr/bin/env bash

if [[ "x$PHAN_CHECKOUT_PATH" == "x" ]]; then
	echo "Must set PHAN_CHECKOUT_PATH in environment"
	exit 1
fi
if [[ ! -d "$PHAN_CHECKOUT_PATH" ]]; then
	echo "Must set PHAN_CHECKOUT_PATH to a valid directory, got: $PHAN_CHECKOUT_PATH"
	exit 1
fi
if [[ ! -d stubs ]]; then
	echo "Must run from the root of this projects (where stubs is a subdirectory)"
	exit 1
fi


docker build -t phan-stubs-builder:7.1-cli -f .docker/Dockerfile .docker
docker run -v "$PWD/stubs":/phan_stubs/ -v "$PWD/.docker":/scripts:ro -v "$PHAN_CHECKOUT_PATH":/phan:ro -e /bin/bash phan-stubs-builder:7.1-cli /scripts/generate_stubs_worker.sh

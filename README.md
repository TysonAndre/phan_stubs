Stubs for Phan
==============

See https://github.com/phan/phan/wiki/How-To-Use-Stubs

This uses `tool/make_stubs -e $EXTENSION_NAME` from Phan and requires `docker` to run

Generating Stubs
----------------

```sh
./make_stubs.sh
```

Adding new extensions
---------------------

for stub generation.

See [`.docker/generate_stubs_worker.sh`](.docker/generate_stubs_worker.sh)

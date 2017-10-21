Stubs for Phan
==============

See https://github.com/phan/phan/wiki/How-To-Use-Stubs

This uses `tool/make_stubs -e $EXTENSION_NAME` from a Phan installation.

Generating Stubs
----------------

Clone [phan](https://github.com/phan/phan) and run `composer install` inside of phan directory.

```sh
export PHAN_CHECKOUT_PATH=/path/to/phan
./make_stubs.sh
```

Adding new extensions
---------------------

for stub generation.

See [`.docker/generate_stubs_worker.sh`](.docker/generate_stubs_worker.sh)

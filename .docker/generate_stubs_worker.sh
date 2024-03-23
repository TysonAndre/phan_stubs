#!/bin/bash
cd /phan/vendor/phan/phan

#EXTENSIONS="apc"
#EXTENSIONS+=" apcu"
#EXTENSIONS+=" igbinary"
#EXTENSIONS+=" redis"
#EXTENSIONS+=" memcached"
#EXTENSIONS+=" yaml"
#EXTENSIONS+=" zip"
#EXTENSIONS+=" mongodb"
#EXTENSIONS+=" mailparse"
#EXTENSIONS+=" xdebug"
#EXTENSIONS+=" ast"
#for extension in $EXTENSIONS; do
#	./tool/make_stubs -e "$extension" > "/phan_stubs/$extension.phan_php"
#done
for extension in $(php -m|grep -E '^\w+$'|grep -vE '^(Core)$'); do
  echo "Generating stubs for '$extension' ..."
  ./tool/make_stubs -e "$extension" > "/phan_stubs/$extension.phan_php"
done

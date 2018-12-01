#!/bin/sh

dirs='/app /config /downloads /tv'

for dir in $dirs; do
    if [ ! -d $dir ]; then
        mkdir -p $dir && chown -R runner:runner $dir
    else
        chown -R runner:runner $dir
    fi
done

exec su-exec runner:runner "$@"
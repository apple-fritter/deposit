#!/bin/bash
for pkgname in $(pm list packages -f | awk -F= '{print $1}' | awk -F: '{print $NF}')
do
    echo "Clearing cache for $pkgname"
    pm clear "$pkgname"
done

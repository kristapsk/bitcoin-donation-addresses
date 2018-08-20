#! /bin/bash

grep -e '\([13][a-km-zA-HJ-NP-Z1-9]\{25,39\}\|bc1[a-z0-9]\{8,87\}\|BC1[A-Z0-9]\{8,87\}\)' README.md | cut -d '|' -f 3,4 | tr '|' ' ' | while read address url; do
    datafile="`tempfile`"
    wget -q -O $datafile $url
    if ! grep -qs $address $datafile; then
        echo "$address not found in $url"
    fi
    rm -f $datafile
done


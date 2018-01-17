#! /bin/bash
format="`echo "$1" | tr '[:upper:]' '[:lower:]'`"
if [ "$format" == "p2pkh" ]; then
    format="1[a-km-zA-HJ-NP-Z1-9]\{25,34\}"
elif [ "$format" == "p2sh" ]; then
    format="3[a-km-zA-HJ-NP-Z1-9]\{25,34\}"
else
    format="[13][a-km-zA-HJ-NP-Z1-9]\{25,34\}"
fi
grep -e "$format" README.md | cut -d '|' -f 3 | shuf -n 1

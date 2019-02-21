#! /bin/bash
format="`echo "$1" | tr '[:upper:]' '[:lower:]'`"
if [ "$format" == "p2pkh" ]; then
    format="[| ]1[a-km-zA-HJ-NP-Z1-9]\{25,39\}"
elif [ "$format" == "p2sh" ]; then
    format="[| ][a-km-zA-HJ-NP-Z1-9]\{25,39\}"
elif [ "$format" == "legacy" ]; then
	format="[| ][13][a-km-zA-HJ-NP-Z1-9]\{25,39\}"
elif [ "$format" == "bech32" ]; then
	format="bc1[a-z0-9]\{8,87\}\|BC1[A-Z0-9]\{8,87\}"
else
    format="\([13][a-km-zA-HJ-NP-Z1-9]\{25,39\}\|bc1[a-z0-9]\{8,87\}\|BC1[A-Z0-9]\{8,87\}\)"
fi
LANG=POSIX grep -e "$format" README.md | cut -d '|' -f 3 | shuf -n 1

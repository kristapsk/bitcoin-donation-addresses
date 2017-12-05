#! /bin/bash
grep -e '[13][a-km-zA-HJ-NP-Z1-9]\{25,34\}' README.md | cut -d '|' -f 3 | shuf -n 1

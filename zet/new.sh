#!/bin/bash
id="$(date +%Y%m%d%H%M%S)"
mkdir -p $id
touch $id/README.md
nvim $id/README.md
git add $id/README.md
git commit -m "$(head -n 1 $id/README.md | awk '{for (i=2; i<NF; i++) printf $i " "; print $NF}')"
git push -u origin main

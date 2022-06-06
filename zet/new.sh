#!/bin/bash
id="$(date +%Y%m%d%H%M%S)"
mkdir -p $id
touch $id/README.md
nvim $id/README.md
git add $id/README.md
git commit -m "zettel $id"
git push -u origin main

#!/bin/bash

set -o errexit

files=$(find $1 -name '*.js')

for f in $files; do
  echo "renaming: ${f} -> ${f%.js}.ts"
  mv -- "$f" "${f%.js}.ts"
done

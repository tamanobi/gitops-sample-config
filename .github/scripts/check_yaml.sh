#/bin/sh
  
set -eu

find ./kubernetes -name "*.yaml" -type f | while read FILE
do
    ./kubeval -o=stdout "${FILE}"
done
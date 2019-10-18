#/bin/sh
  
set -eu

find ${1-.} -name "*.yaml" -type f | while read FILE
do
    # 注意 kubeval はCRDに対応していないためスキップする (https://kubeval.instrumenta.dev/)
    /kubeval -o=tap --strict --skip-kinds Issuer,Certificate "${FILE}"
done
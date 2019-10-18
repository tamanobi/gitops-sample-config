#/bin/sh
  
set -eu

KUBEVAL_PATH=${1-./kubeval}
DIR=${2-.}

find ${DIR} -name "*.yaml" -type f | while read FILE
do
    # 注意 kubeval はCRDに対応していないためスキップする (https://kubeval.instrumenta.dev/)
    ${KUBEVAL_PATH} -o=tap --strict --skip-kinds Issuer,Certificate "${FILE}"
done
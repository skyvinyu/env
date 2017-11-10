#!/bin/bash
MEDOR_PATH=$HOME/star3000/bin/MEDOR
if [ ! -d ${MEDOR_PATH} ];then
    echo "MEDOR PATH: ${MEDOR_PATH} not found!"
    exit 1
fi
ls "${MEDOR_PATH}" | grep -E "RDO[0-9]{8}$" | 
while IFS= read -r rdo_file;do
    echo "Processing TRELPRLN FOUND IN : ${MEDOR_PATH}/${rdo_file} RDO FILE"
    grep '^16'  "${MEDOR_PATH}/${rdo_file}" | 
    sed 's/^[^ ]* [^ ]* \(.*$\)/\1/' | 
    sed '1iNUTRELOR_TRELPR;DTGREPOR_GREP;NUTRELLN_TRELPR;DTGREPLN_GREP;NA_TRELPRLN;ET_TRELPRLN' |
    sed '1,2i--------------;--------------;--------------;--------------;--------------;--------------' | 
    column -tx -s';' 
done

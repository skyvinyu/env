#!/bin/ksh
GRN="\e[32m"
BLU="\e[34m"
RED="\e[31m"
YLW="\e[33m"
BRED="\e[41m"
BGRN="\e[42m"
BBLU="\e[44m"
DFL="\e[0m"
syntax()
{
    printf "Error \tSyntax: ${0##*/} ${YLW}<tglob_file>${DFL} ${YLW}<'col3 col1 ...coln'>${DFL}\n"
    printf "\t${YLW}<tglob_file>${DFL} TGLOB file  (CSV ';' field separator)\n"
    printf "\t${YLW}<'col3 col1 ...coln'>${DFL} optional, columns to view in any order\n"
    exit
}
if [ "$#" -lt 1 ];
then
    syntax
    exit
fi
fname="${1}"
if ! [ -f ${fname} ];
then
    echo "file ${fname} not found"
    exit
fi
columns=( $(head -n1 ${fname} | tr ';' '\n' | cat -n | awk '{ print $1";"$2}'))

if [ "$#" -eq 1 ];
then
    echo "------------------------------------------------"
    echo "----------------- CHOOSE COLUMNS ---------------"
    echo "------------------------------------------------"
    echo
    if [ "${#columns[@]}" -eq 0 ];
    then
        echo "ERROR COLUMN COUNT"
        exit
    fi    
    printf "\t%s\n" "${columns[@]}" | sed -e 's/;/\t/g'
    printf "Choice ex: ${GRN}2 1 4${DFL} ..., hit ${GRN}Enter${DFL} for all): "
    read -r line
else
    shift
    line="$@"
fi
choices=( $(echo ${line}) )
bash_columns=""
for choice in ${choices[@]};
do
    if ! [[ "${choice}" =~ ^[0-9]+$  ]];
    then
        echo "incorrect choice !!! "
        exit
    fi
    bash_columns="${bash_columns}\";\"\$${choice%%;*}"
done
bash_columns="${bash_columns:3:${#bash_columns}}"
eval "awk -F';' '{ print ${bash_columns} }' ${fname}" | column -tx -s ';' 


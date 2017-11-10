#!/bin/ksh
DB_TYPE="P"
EXTRACT=0

if [ $# -gt 1 ];
then
    if [ "${1}" = "x" -o "${1}" = "-x" -o "${1}" = "X" -o "${1}" = "-X" ];
    then
        EXTRACT=1
        shift
    fi
fi

if [ $# -gt 1 ];
then
    if [ "${1}" = "t" -o "${1}" = "-t" -o "${1}" = "T" -o "${1}" = "-T" ];
    then
        DB_TYPE="U"
        EXTRACT=0
        shift
    fi
fi

for arg in "$@";
do
    SQL_PATTERN="`echo ${arg//\*/%}| tr '[:lower:]' '[:upper:]'`"
    com1 <<<' select name from master..sysdatabases where name like "com1[_]%" or name = "SQL_PROC_SPO"
go !' 2>&1 | grep -E '^ (com1_|SQL_PROC_SPO)' | sed -e 's/^ *//' -e 's/ *$//' | 
    while IFS= read -r db;
    do
        rq="select '${db}..'+ name from ${db}..sysobjects where type = '${DB_TYPE}' and UPPER(name) like '${SQL_PATTERN}'
go
!"
    com1 <<< ${rq} 2>&1 
    done | sed -e 's/^ *//g' -e 's/ *$//g' | grep "^\(com1_[^ ]*\|SQL_PROC_SPO\)\.\.[^ ]*$"
done |

while IFS= read line;
do
    if [ ${EXTRACT} -eq 1 ];then
        echo "${line} to `pwd`/${line}.sql"
    echo -en "use ${line%%\.\.*}\ngo\n\nif (exists (select name from sysobjects where name='${line##*\.\.}'))\n\tdrop procedure ${line##*\.\.}\ngo\n\n`sp_helptext SYBSM002 com1 com11234 ${line//\./ }`\ngo\n\n" > ${line}.sql 
    else
        echo ${line}
    fi
done
rm sp_helptext.actlog 2>/dev/null

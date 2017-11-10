#!/bin/bash
cmd="`basename ${0}`"
fType=${cmd:0:1}
path="."
exp=""
if [ $# -gt 0 ];
then
	if [ -d "${1}" ];then
		path="${1}"
		shift
	fi
	idx=0
	for i in $@;do
		if [ ${idx} -eq 0 ];
		then
			idx=1
			exp="${exp} -name '${i}'"
		else
			exp="${exp} -o -name '${i}'"
		fi
	done
fi
eval "find ${path} -type ${fType} ${exp}"


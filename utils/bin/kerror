#!/bin/bash
if [ $# -eq 0 ];then
	exit 0
fi
. ${KME_HOME}/scripts/colors.sh 
text=""
for arg in "$@";do
	text="$text $arg"
done
printf "${BRED}KME_ERROR:${DFL} ${text}\n"  1>&2

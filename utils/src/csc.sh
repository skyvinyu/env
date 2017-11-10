#!/bin/bash
. $KME_HOME/scripts/src/colors.sh
tab=$'\t'
if [ -f "$1" ];then
	grep -Ev  "^([ ${tab}]*)*((#)|($))" "$1"
else
	kerror "$1 No such file or directory"
fi

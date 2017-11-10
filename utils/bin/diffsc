#!/bin/bash
diff_expr=""
for i in "$@";do
	if [ -f "${i}" ];then
		diff_expr="$diff_expr <(csc "$i")"
	fi
done
if [ ! "${diff_expr}" = "" ];then
	eval "vimdiff ${diff_expr}"
fi

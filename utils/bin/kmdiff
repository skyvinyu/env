#!/bin/bash
FRED='\e[91m'
FGRN='\e[92m'
FYLW='\e[93m'
FBLU='\e[94m'
FDFL='\e[0m'
STR_FORMAT="%-70s"
DELIM=";"
if [ "$#" -lt 2 ]; then 
    printf "\n$FGRN Usage: kmdiff path_1 path_2 file_extension\n ex: kmdiff ./path1 ./path2 file_type file_filter $FDFL\n\n"
	exit 0 
fi

path_1="$1"
path_2="$2"
file_type=" "
file_filter=" "

if [ ! -d $path_1 ];then
    echo "path: $path_1 not exist"
    exit 1
fi

if [ ! -d $path_2 ];then
    echo "path: $path_1 not exist"
    exit 1
fi

if [ "$#" -gt 2 ]; then
    file_type="-type $3"
fi

if [ "$#" -gt 3 ]; then
    file_filter="-iname  '"$4"'"
fi
show_files_options=( yes no )
printf "Show files diff ?.\n"
#select show_files in ${show_files_options[@]};do 
#	break	
#done
show_files="no"
diff_log="diff.log"
printf ""$FBLU"find $path_1 $file_type $file_filter \n$FDFL"
>$diff_log

eval "find ${path_1} ${file_type} ${file_filter}" | 
while IFS= read -r i;do
    DIFF="?"
    fname="$(basename "$i" )"
    find "${path_2}" -name "$fname"  |
    while IFS= read -r j;do
		diff_out=$(diff -bBE "$i" "$j")
        if [ $? -eq 0 ]; then
            printf "%s"$DELIM"%s"$DELIM"E\n" "$i" "$j" >> $diff_log
            DIFF="E"
		else
            DIFF="D"
            printf "%s"$DELIM"%s"$DELIM"D\n" "$i" "$j" >> $diff_log
		    if [ "$show_files" = "yes" ]; then
                vimdiff $i $j
			fi
        fi
    done
	if [ "$DIFF" = "?" ]; then
        printf "%s"$DELIM"?"$DELIM"?\n" "$i" >> $diff_log
	fi
    unset j i DIFF
done
#grep    ';?;?$' $diff_log | column -s';' -tx
grep -v ';?;?$' $diff_log | column -s';' -tx 
#column -s';' -tx $diff_log

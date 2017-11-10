#!/bin/bash
if [ ! "$1" = "" ];then
    ps -A -o pid,cmd | /bin/grep " \./$1 " | /bin/grep -v "/bin/grep \./$1 " | awk '{ print $1}'| xargs -i kill -9 {}
fi

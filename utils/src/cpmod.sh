#!/bin/bash
exp="scp kme@10.6.2.231:~/workspace/gen_${wmod}/src/${wmod} ${KME_HOME}/livrable/${wmod}/"
echo "${exp}"
eval "${exp}"

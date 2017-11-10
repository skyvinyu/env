#!/bin/bash
if [ "$1" ];then
    exp="cpmod"
    read -n1 -r -p " IMPORT NEW BIN : ${exp}"
    eval ${exp}
fi
exp="kkill ${wmod}"
read -n1 -r -p " KILL MODULE : ${exp}"
eval ${exp}

exp="cp ${KME_HOME}/livrable/${wmod}/${wmod} ${KME_HOME}/home_${wmod}/${wmod}"
read -n1 -r -p " COPY NEW BIN : ${exp}"
eval "${exp}"

exp=">  ${KME_HOME}/home_${wmod}/res${wmod}"
read -n1 -r -p " INIT RES FILE: ${exp}"
eval ${exp}

exp="lancer_${wmod}"
read -n1 -r -p " RELANCER LE MODULE: ${exp}"
eval ${exp}

exp="xt ${wmod}"
read -n1 -r -p " MODULE OUTPUT: ${exp}"
eval ${exp}

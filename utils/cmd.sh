export PS1="`echo ${PS1} | sed -e 's|:${PWD}>| ${MACHINE}:${PWD}$ |' -e 's|^${MACHINE}=||'`"

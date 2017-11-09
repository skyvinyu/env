
export PS1="`echo ${PS1} | sed -e 's|:${PWD}>| ${MACHINE}:${PWD}$ |' -e 's|^${MACHINE}=||'`"
export YYU_HOME="$HOME/livre/yyu"


#export HISTFILE=${YYU_HOME}/.bash_hist
alias ls="ls --color=auto"
alias ll="ls -Al"
alias l="ls"
alias gh="cd $YYU_HOME"

alias arg=' xargs -i '
alias grep='/bin/grep --color=auto '
alias column="column -tx -s';'"

mkdir -p ${YYU_HOME}/scripts/bin ${YYU_HOME}/scripts/src
rm -rf "${YYU_HOME}/scripts/bin/*"
for script in $(ls $YYU_HOME/scripts/src/*.sh 2>/dev/null);
do
    fname="`basename $script`"
    echo $fname
    if [ -x $script ];then
        ln -sf $script "$YYU_HOME/scripts/bin/${fname%.sh}"
    fi
done
unset script fname
export PATH=$PATH:$YYU_HOME/scripts/bin


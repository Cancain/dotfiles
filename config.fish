set -gx PATH ~/bin $PATH
set -gx ANDROID_SDK_ROOT /opt/android-sdk

if test -z "$SSH_AGENT_PID"
  eval (ssh-agent -c)
end

alias gs="git status"
alias gb="git branch"
alias gl="git log"
alias rebase="git fetch origin && git rebase origin/master"
alias yh="yarn_here"
alias connect="cd /home/tomeri/connect/"
alias native="cd /home/tomeri/connect/native"
alias web="cd /home/tomeri/connect/web"
alias shared="cd /home/tomeri/connect/shared"
alias scr="./scripts/screens.sh"
alias kdiscord="pkill -9 -f discord"
alias webs="cd /home/tomeri/connect/web && yarn start"
alias natives="cd /home/tomeri/connect/native && yarn start"
alias ra="cd /home/tomeri/connect/native && yarn ra"
alias codecon="code /home/tomeri/connect"
alias coden="code /home/tomeri/connect/native"
alias codew="code /home/tomeri/connect/web"
alias codef="code /home/tomeri/connect/functions"
alias coder="code /home/tomeri/connect/firestore"
alias todo="/home/tomeri/todoist/todoist"
alias cam="sudo simple_droidcam_client"
alias pophome='pop "pop://join?roomId=769-767-277"'
alias addall="git add --a"
alias constants="nvim /home/tomeri/connect/shared/constants.ts"
alias colors="cat /home/tomeri/connect/shared/constants.ts"
alias rmerged="git branch --merged | egrep -v '(^\*|master|main|dev)' | xargs git branch -d"
alias ac="git add --a && git commit"

set --export JAVA_HOME /usr/lib/jvm/java-11-openjdk/
set --export ANDROID_HOME /opt/android-sdk/

export EDITOR=nvim
export REACT_EDITOR=webstorm
export RIPGREP_CONFIG_PATH=$HOME/.rgrc

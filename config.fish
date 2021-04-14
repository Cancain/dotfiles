set -gx PATH ~/bin $PATH
set -gx ANDROID_SDK_ROOT /opt/android-sdk

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
alias todo="/home/tomeri/todoist/todoist"
alias rmerged="/home/tomeri/Scripts/rmerged"

export EDITOR=nvim


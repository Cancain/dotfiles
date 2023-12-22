set -gx PATH ~/bin $PATH
set -gx ANDROID_SDK_ROOT /opt/android-sdk

if test -z "$SSH_AGENT_PID"
  eval (ssh-agent -c)
end

function fish_prompt
    set_color green
    echo -n (pwd)  \n
    set_color blue
    echo ' > '
end

source ~/.config/fish/fish_aliases

set --export JAVA_HOME /usr/lib/jvm/java-11-openjdk/
set --export ANDROID_HOME /opt/android-sdk/
set -gx PATH ~/.cargo/bin $PATH

export EDITOR=nvim
export REACT_EDITOR=nvim
export RIPGREP_CONFIG_PATH=$HOME/.rgrc

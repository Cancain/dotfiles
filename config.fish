set -gx PATH ~/bin $PATH
set -gx ANDROID_SDK_ROOT /opt/android-sdk

if test -z "$SSH_AGENT_PID"
  eval (ssh-agent -c)
end

function fish_prompt
    set_color green
    echo -n (pwd)
    set_color yellow

    if test (git symbolic-ref --short HEAD 2> /dev/null)
        set_color blue
        echo -n " "
        set_color yellow --bold
        git symbolic-ref --short HEAD 2> /dev/null
    end
    set_color blue
    echo -n ' > '
end | string replace -r '\n$' ''

source ~/.config/fish/fish_aliases

set --export JAVA_HOME /usr/lib/jvm/java-11-openjdk/
set --export ANDROID_HOME /opt/android-sdk/
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH ~/.bun/bin $PATH

export EDITOR=helix
export REACT_EDITOR=nvim
export RIPGREP_CONFIG_PATH=$HOME/.rgrc

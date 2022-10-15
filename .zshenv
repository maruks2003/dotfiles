typeset -U path PATH
path=(~/.local/bin $path)
path=(~/.local/share/gem/ruby/3.0.0/bin $path)
path=(~/scripts $path)
path=(/usr/local/bin $path)
path=(~/go/bin $path)
export PATH

export _JAVA_AWT_WM_NONREPARENTING=1
export EDITOR=/usr/bin/nvim
export DOWNLOADS=$HOME/downloads
export XDG_CONFIG_HOME=$HOME/.config
export TRANSPARENCY=75

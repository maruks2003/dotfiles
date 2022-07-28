fpath=(~/.config/zsh/myfns $fpath)
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=200
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Prompt themes
autoload -Uz compinit promptinit
compinit
promptinit
prompt walters

# Wal color scheme
(cat ~/.cache/wal/sequences &)

fpath=(~/.config/zsh/myfns $fpath)
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=200
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"


# Vi mode stuff
KEYTIMEOUT=1


autoload -Uz compinit promptinit
# Completion
zstyle ":completion:*" menu select 
zmodload zsh/complist
compinit
promptinit

bindkey -M menuselect "h" vi-backward-char
bindkey -M menuselect "j" vi-down-line-or-history
bindkey -M menuselect "k" vi-up-line-or-history
bindkey -M menuselect "l" vi-forward-char

# Prompt theme
prompt walters

# Wal color scheme
(cat ~/.cache/wal/sequences &)

# Everything below this line doesn't function correctly on login shells
# so we'll just have to return here
[[ -o login ]] && return

# Change cursor shape for different vi modes
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne "\e[5 q"
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    # Initiate `vi insert` as keymap
    # (can be removed if `bindkey -V` has been set elsewhere)
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init

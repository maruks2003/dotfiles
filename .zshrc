fpath=(~/.config/zsh/myfns $fpath)
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=200
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

# direnv
eval "$(direnv hook zsh)"


# Some useful aliases

# Choose random file from directory
#alias randfile="ls | sort -R | head -n 1"
# ls with color
alias ls="ls --color=auto"
# Git for dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
# lf to use with images
alias lf="lfrun"
# run the previous command as sudo
alias fuck='sudo $(fc -nl -1)'
# Hibernate
alias hibernate="systemctl hibernate"
# Jo Biden wake up
alias jo-biden="wol 2c:27:d7:3c:8d:70"
# Source ranger
alias ranger=". ranger"

nvim_or_exec ()
{
  if [ "$1" = "$(basename $1)" ]; then
    nvim "$1"
  else
    ${@:1}
  fi
}

# Nvim opening stuff
alias -s {txt,c,asm,rs,h,tex}=nvim
alias -s py=nvim_or_exec
alias Makefile="nvim Makefile"

# End of useful aliases

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

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# show venv prompt
setopt PROMPT_SUBST
show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}
PROMPT='$(show_virtual_env)'$PROMPT

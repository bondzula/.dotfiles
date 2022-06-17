# Enable colors and change prompt:
autoload -U colors && colors

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Emacs Mode
bindkey -e

# Edit line in vim with ctrl-e:
# autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line

# Fuzzy find directory to open in tmux
bindkey -s ^p "tmux-new-session\n"

# Aliases
#alias dotfiles='/run/current-system/sw/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias cat="bat"
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

fcd() {
  pushd "$(fd --type d --hidden -a | fzf --border none)"
}

open() {
  xdg-open "$(fd --type f --hidden | fzf)"
}

alias getpath="fd --type f -H -a | fzf | sed 's/^..//' | tr -d '\n' | xclip -selection c"

# Fix the wget hist file path
alias wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"

# Add fzf keybindings
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

# Direnv
eval "$(direnv hook zsh)"

# Starship prompt
eval "$(starship init zsh)"

# Enable colors and change prompt:
autoload -U colors && colors

# PATH scripts / node manager / rust binaries
export PATH=$HOME/bin:$HOME/.fnm:$HOME/.cargo/bin:$PATH

# History in cache directory:
export HISTFILE=$HOME/.cache/zsh/history
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
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

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# FZF
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fd --type f --hidden'

source /usr/share/fzf/key-bindings.zsh

# Fuzzy find directory to open in tmux
bindkey -s ^p "tmux-sessionizer\n"

# Aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias cat="bat"

# fnm - Fast Node Manager https://github.com/Schniz/fnm
eval "`fnm env`"
eval "$(fnm env --use-on-cd)"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Starship prompt
eval "$(starship init zsh)"

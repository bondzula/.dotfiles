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
# export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -v '^?' backward-delete-char

# Edit line in vim with ctrl-e:
# autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line

source /home/linuxbrew/.linuxbrew/opt/fzf/shell/completion.zsh
source /home/linuxbrew/.linuxbrew/opt/fzf/shell/key-bindings.zsh

# Fuzzy find directory to open in tmux
bindkey -s ^p "tmux-sessionizer\n"

# Aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias cat="bat"
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

# Fix the wget hist file path
alias wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"

# # fnm - Fast Node Manager https://github.com/Schniz/fnm
eval "`fnm env`"
eval "$(fnm env --use-on-cd)"

# Load zsh-syntax-highlighting; should be last.
source /home/linuxbrew/.linuxbrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Starship prompt
eval "$(starship init zsh)"

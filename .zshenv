typeset -U PATH PATH

# Other XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}

# Fixing the paths
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export HISTFILE=$XDG_DATA_HOME/zsh/history
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgrep/ripgreprc
export GOPATH=$XDG_DATA_HOME/go
export CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export KDEHOME=$XDG_CONFIG_HOME/kde 
export PYENV_ROOT=$XDG_DATA_HOME/pyenv

# Disable files
export LESSHISTFILE=-

# Default Apps
export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"
export BROWSER="firefox"
export TERMINAL="alacritty"
export VIDEO="mpv"
export PAGER="less"
export OPENER="xdg-open"

# Path
path=("$HOME/.local/bin/" "$XDG_DATA_HOME/fnm" "$XDG_DATA_HOME/cargo/bin" "$XDG_DATA_HOME/go/bin" "$path[@]")

export PATH

# History
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTTIMEFORMAT="%Y-%m-%d %T "

# FZF
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fd --type f --hidden'

# ZK
export ZK_NOTEBOOK_DIR=/media/share/notes

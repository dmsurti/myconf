# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

export TERM=xterm-256color

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:~/anaconda/bin:/sbin:/opt/X11/bin:~/.dotfiles/bin:$PATH

# Powerline
. /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# alias vi and vim to macvim
alias vi="mvim -v"
alias vim="mvim -v"

# vi key bindings for zsh
export EDITOR="mvim -v"
bindkey -v

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# ruby rbevn
export RBENV_ROOT="$(brew --prefix rbenv)"
export GEM_HOME="$(brew --prefix)/opt/gems"
export GEM_PATH="$(brew --prefix)/opt/gems"

#alias my dotfiles config
alias config='git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

# add latex path
export PATH="$PATH:/Library/TeX/Distributions/TeXLive-2012.texdist/Contents/Programs/texbin/" # Required El Capitan onwards

# blender
export PATH="/Applications/Blender/blender.app/Contents/MacOS/blender:$PATH"
alias blender=/Applications/Blender/blender.app/Contents/MacOS/blender
export PYTHONPATH="$HOME/repos/git/blender-source/build_darwin_bpy/bin:$PYTHONPATH"

# homebrew
export HOMEBREW_NO_GITHUB_API=1

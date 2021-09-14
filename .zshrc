# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:$HOME/.local/bin:/home/brad/.ebcli-virtual-env/executables:$HOME/code/dotfiles/bin:/usr/local/lib
export CDPATH=$HOME:$HOME/code

export HISTSIZE=10000000
export SAVEHIST=10000000

# Path to your oh-my-zsh installation.
export ZSH="/home/brad/.oh-my-zsh"
export EDITOR="/usr/bin/vim"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(aws docker git terraform)

source $ZSH/oh-my-zsh.sh

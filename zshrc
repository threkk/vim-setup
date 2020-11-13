# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
if [[ -d $HOME/.config/zsh_custom ]]; then
  ZSH_CUSTOM=$HOME/.config/zsh_custom
fi

# Set name of the theme to load. Optionally, if you set this to "random"
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
if [[ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]]; then
  ZSH_THEME="powerlevel10k/powerlevel10k"

  if [ -f $HOME/.p10k.zsh ]; then
    source $HOME/.p10k.zsh
  fi
else
    ZSH_THEME="norm"
fi

# Which plugins would you like to load? (plugins can be found in $HOME/.oh-my-zsh/plugins/*)
# Custom plugins may be added to $HOME/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew common-aliases docker gitfast git-extras github httpie npm osx pip python z)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Ensure correct SHELL version
[ -z "$ZSH_VERSION" ] || export SHELL="/bin/zsh"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# SSH
export SSH_KEY_PATH="${HOME}/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate $HOME/.zshrc"
# alias ohmyzsh="mate $HOME/.oh-my-zsh"
#

# Extra config
export HOME

export HOMEBREW_NO_ANALYTICS=1
export PYTHONDONTWRITEBYTECODE=1
export XDG_CONFIG_HOME=$HOME/.config
export GOPATH=$HOME/.go
export NVM_DIR="$HOME/nvm"

if [[`uname` eq 'Linux' ]]; then
  BREW_PREFIX='/home/linuxbrew/.linuxbrew'
else
  BREW_PREFIX='/usr/local'
fi

# Exports
if [ -f $HOME/.exports.sh ]; then
  . $HOME/.exports.sh
fi

# Path
export PATH=$BREW_PREFIX/sbin:$PATH
export PATH=$BREW_PREFIX/bin:$PATH
export PATH="$BREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$BREW_PREFIX/opt/grep/libexec/gnubin:$PATH"
export PATH=$GOPATH/bin:$PATH
export PATH=`npm bin --global`:$PATH
export PATH=$HOME/.bin:$PATH

eval "$(pyenv init -)"

if [ -s "$BREW_PREFIX/opt/nvm/nvm.sh"  ]; then
  . "$BREW_PREFIX/opt/nvm/nvm.sh"
fi

if [ -s "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ]; then
  . "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
fi

# Auto completation
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f $BREW_PREFIX/share/zsh-syntax-highlighting.zsh ] && source $BREW_PREFIX/share/zsh-syntax-highlighting.zsh
[ -f $BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source $BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

fpath=($BREW_PREFIX/share/zsh-completions $fpath)
autoload -U bashcompinit
bashcompinit

if [ -f ~/.alias ]; then
    . ~/.alias
fi

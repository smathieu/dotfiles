# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="smathieu"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

export DIFF=`which ksdiff`
export EDITOR="vim"

alias git_no_ws='git stash && git stash apply && git diff -w --no-ext-diff > foo.patch && git checkout . && git apply foo.patch && rm foo.patch'
alias be='bundle exec'
alias bu='bundle update'

# Fix MYSQL gem 
#export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
export PATH=/opt/local/bin:/opt/local/sbin:$HOME/bin:$HOME/src/github.com/smathieu/dotfiles:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/share/npm/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
unsetopt correct_all

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

# added by travis gem
[ -f /Users/simon/.travis/travis.sh ] && source /Users/simon/.travis/travis.sh

export GOPATH=`pwd`

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

if [[ -f $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh ]]; then
    source $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh
    source $HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh
fi

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


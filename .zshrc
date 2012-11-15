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
# DISABLE_AUTO_UPDATE="true"

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

# Customize to your needs...
export PATH=/Users/simon/aws/ec2/bin:/opt/local/bin:/opt/local/sbin:/Users/simon/bin:/usr/local/mysql/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/Users/simon/ec2-api-tools-1.4.4.0/bin:/Users/simon/.rvm/bin:/usr/local/go/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

alias g=" ./script/generate"
alias be="bundle exec"
alias cap="bundle exec cap"
export DIFF=/Applications/Kaleidoscope.app/Contents/MacOS/ksdiff

export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

export BACKTRACE=1
export EC2_HOME="$HOME/aws/ec2"
export EC2_CERT="$HOME/aws/keys/cert-7E4KLFVENMECELH5J2MNCWEVO7AGKA4A.pem"
export EC2_PRIVATE_KEY="$HOME/aws/keys/pk-7E4KLFVENMECELH5J2MNCWEVO7AGKA4A.pem"
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home"

alias src="cd $HOME/Documents/code/web"
alias mercury="cd $HOME/Documents/code/mercury"
alias caduceus="cd $HOME/Documents/code/caduceus"
alias chef="cd $HOME/Documents/code/chef"
alias git_no_ws="git stash && git stash apply && git diff -w --no-ext-diff > foo.patch && git checkout . && git apply foo.patch && rm foo.patch"
alias sbt="JAVA_OPTS='-Xmx2548M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=1024M' sbt"

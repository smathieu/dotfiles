#. /sw/bin/init.sh 
export CLICOLOR=1

if [ -f /usr/local/git/bin/git-completion.bash ]; then
    source /usr/local/git/bin/git-completion.bash
fi

if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
    source /usr/local/git/contrib/completion/git-completion.bash
fi



PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[00;36m\]\w\[\033[00;33m\] \$(__git_ps1 '(%s) ')\[\033[00m\]"


##
# Your previous /Users/simon/.bash_profile file was backed up as /Users/simon/.bash_profile.macports-saved_2010-06-05_at_14:10:55
##

# MacPorts Installer addition on 2010-06-05_at_14:10:55: adding an appropriate PATH variable for use with MacPorts.

export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:$PATH:/Users/simon/ec2-api-tools-1.4.4.0/bin
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/simon/.bash_profile file was backed up as /Users/simon/.bash_profile.macports-saved_2010-10-04_at_22:33:00
##

# MacPorts Installer addition on 2010-10-04_at_22:33:00: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:/Users/simon/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Fix MYSQL gem 
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.


# Rails stuff
BACKTRACE=1
alias g=" ./script/generate"
alias be="bundle exec"
alias guard="bundle exec guard"
alias rake="bundle exec rake"
alias rails="bundle exec rails"
alias cap="bundle exec cap"

export DIFF=/Applications/Kaleidoscope.app/Contents/MacOS/ksdiff

export LSCOLORS=dxfxcxdxbxegedabagacad

# This should probably reflect whichever paths you choose for keeping your working copy of the general repo
# EC2 Stuff
export EC2_HOME="$HOME/aws/ec2"
export EC2_CERT="$HOME/aws/keys/cert-7E4KLFVENMECELH5J2MNCWEVO7AGKA4A.pem"
export EC2_PRIVATE_KEY="$HOME/aws/keys/pk-7E4KLFVENMECELH5J2MNCWEVO7AGKA4A.pem"
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home"
export PATH="$EC2_HOME/bin:$PATH"

alias src='cd /Users/simon/Documents/code/web'
alias git_no_ws="git stash && git stash apply && git diff -w --no-ext-diff > foo.patch && git checkout . && git apply foo.patch && rm foo.patch"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

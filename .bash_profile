#. /sw/bin/init.sh 

export CLICOLOR=1

source /usr/local/git/bin/git-completion.bash


PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[00;36m\]\w\[\033[00;33m\] \$(__git_ps1 '(%s) ')\[\033[00m\]"


##
# Your previous /Users/simon/.bash_profile file was backed up as /Users/simon/.bash_profile.macports-saved_2010-06-05_at_14:10:55
##

# MacPorts Installer addition on 2010-06-05_at_14:10:55: adding an appropriate PATH variable for use with MacPorts.

export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:$PATH
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
alias yserver="rvmsudo DYLD_LIBRARY_PATH=/usr/local/mysql/lib ruby script/server -p 80" 
alias g=" ./script/generate"
alias ysrc="cd ~/Documents/yardstick/yardstick/"

export DIFF=/Applications/Kaleidoscope.app/Contents/MacOS/ksdiff

export LSCOLORS=dxfxcxdxbxegedabagacad

alias staging="osascript ~/Documents/yardstick/styleterm.scpt 'Red Sands'; ssh deploy@primus_staging; osascript ~/Documents/yardstick/styleterm.scpt 'Custom'"
alias production="osascript ~/Documents/yardstick/styleterm.scpt 'Red Sands'; ssh deploy@primus; osascript ~/Documents/yardstick/styleterm.scpt 'Custom'"

export HADOOP_HOME="/Users/simon/Applications/hadoop"
alias hadoop="/Users/simon/Applications/hadoop/bin/hadoop"

alias activeblogr="ssh -i /Users/simon/Documents/ruby/activeblogr/actibeblogr.pem bitnami@ec2-75-101-169-128.compute-1.amazonaws.com"
alias reset_db="rake db:bootstrap:reset db:test:prepare"

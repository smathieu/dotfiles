#. /sw/bin/init.sh 
export CLICOLOR=1

export GOPATH=$HOME
export ANDROID_HOME=$HOME/Library/Android/sdk/


export PATH=$HOME/bin:$PATH

# Rails stuff
alias be="bundle exec"
alias bu="bundle update"
alias rake="bundle exec rake"
alias rails="bundle exec rails"

export DIFF=/Applications/Kaleidoscope.app/Contents/MacOS/ksdiff

export LSCOLORS=dxfxcxdxbxegedabagacad

alias git_no_ws="git stash && git stash apply && git diff -w --no-ext-diff > foo.patch && git checkout . && git apply foo.patch && rm foo.patch"
alias kit="cd /Users/simonmathieu/src/github.com/Shopify/kit/"

function run-modified-specs {
  git status -s | grep _spec | awk '{print $2}' | xargs bundle exec rspec
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
if [ -e /Users/simonmathieu/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/simonmathieu/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

#. /sw/bin/init.sh 
export CLICOLOR=1

export GOPATH=$HOME


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

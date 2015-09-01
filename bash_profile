alias b2gdt='gaiatest --testvars=mine/b2g.gaia.hamachi.json --type=b2g --app=b2gdesktop --binary=/Applications/B2G.app/Contents/MacOS/b2g-bin --profile=/Applications/B2G.app/Contents/MacOS/gaia/profile --restart --html-output=results/index.html'
alias b2gh='gaiatest --address=localhost:2828 --testvars=mine/b2g.gaia.hamachi.json --restart --html-output=results/index.html'
alias b2gf='gaiatest --address=localhost:2828 --testvars=mine/b2g.gaia.flame.json --restart --html-output=results/index.html'
alias b2gi='gaiatest --address=localhost:2828 --testvars=mine/b2g.gaia.inari.json --restart --html-output=results/index.html'
alias b2gm='gaiatest --address=localhost:2828 --testvars=mine/b2g.gaia.mozilla.json --restart --html-output=results/index.html'
alias gr='cd /Users/bsilverberg/gitRepos'
alias hm='cd /Users/bsilverberg'

# for hubusr
alias git=hub

alias gs='git status'
alias co='git checkout'

alias ga='git add -A'
alias gc='git commit'
alias gca='git commit -a'
alias gm='git merge'
alias gpm='git push origin master'
alias gpm='git push origin develop'
alias gppv101='git pull upstream v1.0.1; git push origin v1.0.1; git push upstream v1.0.1'
alias gppv1t='git pull upstream v1-train; git push origin v1-train; git push upstream v1-train'
alias gppm='git pull upstream master; git push origin master; git push upstream master'
alias dtup="cd ~/tempGitRepos/dotfiles; git add .; git commit -m 'updating dotfiles'; git push"
alias dtdn="cd ~/Documents/gitRepos/dotfiles; git pull origin master"
alias cf8="cd /Library/Webserver/Documents/; mv CFIDE_CF8 CFIDE; /Applications/JRun4/bin/jrun -start cfusion; mv CFIDE CFIDE_CF8; hm;"
alias cf9u1="cd /Library/Webserver/Documents/; mv CFIDE_CF9 CFIDE; /Developer/CF9/bin/jrun -start cfusion; mv CFIDE CFIDE_CF9; hm;"
alias cf9="cd /Library/Webserver/Documents/; mv CFIDE_CF90 CFIDE; /Developer/CF9.0/bin/jrun -start cfusion; mv CFIDE CFIDE_CF90; hm;"
#alias cf9="cd /Applications/ColdFusion9/bin/; ./coldfusion start"
#alias cf9stop="cd /Applications/ColdFusion9/bin/; ./coldfusion stop"
alias b2g-11="ssh webqa:mozilla@10.250.1.86"
alias pudb='python -m pudb.run'
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

export STACKATO_EXECUTABLE=s

# Make TextMate the default editor
export EDITOR="/usr/local/bin/mate -w" 

##### put git branch & status in prompt
 
        RED="\[\033[0;31m\]"
     YELLOW="\[\033[0;33m\]"
    GREEN="\[\033[0;32m\]"
       BLUE="\[\033[0;34m\]"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 COLOR_NONE="\[\e[0m\]"
       GRAY="\[\033[1;30m\]"

function nb () {
	git checkout $1
	git pull upstream $1
	git branch -D $2
	git checkout -b $2
}

function gdb () {
	git branch -D `git for-each-ref --format="%(refname:short)" refs/heads/$1\*`
}


function wget_r () {
	wget http://qa-selenium.mv.mozilla.com:8080/view/Marketplace/job/$1/lastSuccessfulBuild/artifact/results.xml -O xml_results/$1.xml
}

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
 
function set_prompt {
  export PS1="${COLOR_NONE}\w${RED}$(parse_git_branch)${COLOR_NONE}$ "
}
PROMPT_COMMAND='set_prompt'

source ~/.git-completion.bash

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# For local git version
export PATH=/usr/local/git/bin:$PATH
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

# MacPorts Installer addition on 2012-07-20_at_09:23:12: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# for node.js
export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/share/npm/bin:/opt/local/lib/node_modules/less/bin:$PATH"
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules

# for adt (b2g)
export  PATH=/Applications/adt-bundle-mac/sdk/platform-tools:${PATH}
export PATH=/Applications/adt-bundle-mac/sdk/tools:${PATH}

# for android (appium)
export ANDROID_HOME="/Applications/adt-bundle-mac/sdk"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH"

# Get the bin for any local NodeJS module on cwd.
export PATH="./node_modules/.bin:$PATH"

#Path for Postgres
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"

function rmb {
  current_branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  if [ "$current_branch" != "master" ]; then
    echo "WARNING: You are on branch $current_branch, NOT master."
  fi
    echo "Fetching merged branches..."
  git remote prune origin
  remote_branches=$(git branch -r --merged | grep -v '/master$' | grep -v "/$current_branch$")
  local_branches=$(git branch --merged | grep -v 'master$' | grep -v "$current_branch$")
  if [ -z "$remote_branches" ] && [ -z "$local_branches" ]; then
    echo "No existing branches have been merged into $current_branch."
  else
    echo "This will remove the following branches:"
    if [ -n "$remote_branches" ]; then
      echo "$remote_branches"
    fi
    if [ -n "$local_branches" ]; then
      echo "$local_branches"
    fi
    read -p "Continue? (y/n): " -n 1 choice
    echo
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
      # Remove remote branches
      git push origin `git branch -r --merged | grep -v '/master$' | grep -v "/$current_branch$" | sed 's/origin\//:/g' | tr -d '\n'`
      # Remove local branches
      git branch -d `git branch --merged | grep -v 'master$' | grep -v "$current_branch$" | sed 's/origin\///g' | tr -d '\n'`
    else
      echo "No branches removed."
    fi
  fi
}

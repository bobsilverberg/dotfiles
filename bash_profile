alias gr='cd /Users/robertsilverberg/Documents/gitRepos'
alias hm='cd /Users/robertsilverberg'
alias gs='git status'
alias co='git checkout'
alias ga='git add -A'
alias gc='git commit'
alias gca='git commit -a'
alias gm='git merge'
alias gpm='git push origin master'
alias gpm='git push origin develop'
alias dtup="cd ~/tempGitRepos/dotfiles; git add .; git commit -m 'updating dotfiles'; git push"
alias dtdn="cd ~/Documents/gitRepos/dotfiles; git pull origin master"
alias cf8="cd /Library/Webserver/Documents/; mv CFIDE_CF8 CFIDE; /Applications/JRun4/bin/jrun -start cfusion; mv CFIDE CFIDE_CF8; hm;"
alias cf9u1="cd /Library/Webserver/Documents/; mv CFIDE_CF9 CFIDE; /Developer/CF9/bin/jrun -start cfusion; mv CFIDE CFIDE_CF9; hm;"
alias cf9="cd /Library/Webserver/Documents/; mv CFIDE_CF90 CFIDE; /Developer/CF9.0/bin/jrun -start cfusion; mv CFIDE CFIDE_CF90; hm;"
#alias cf9="cd /Applications/ColdFusion9/bin/; ./coldfusion start"
#alias cf9stop="cd /Applications/ColdFusion9/bin/; ./coldfusion stop"
export HISTCONTROL=erasedups

# Make TextMate the default editor
export EDITOR="/usr/bin/mate -w" 

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


# Setting PATH for Python 3.2
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.2/bin:${PATH}"
export PATH

export PATH="./bin:$PATH" 
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH="/Users/robertsilverberg/Documents/gitRepos/depot_tools:${PATH}"

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
PATH="/System/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"
export PATH

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh


##
# Your previous /Users/robertsilverberg/.bash_profile file was backed up as /Users/robertsilverberg/.bash_profile.macports-saved_2012-07-20_at_09:23:12
##

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

# MacPorts Installer addition on 2012-07-20_at_09:23:12: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# for node.js
export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/share/npm/bin:/opt/local/lib/node_modules/less/bin:$PATH"



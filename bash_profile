alias gr='cd /Users/robertsilverberg/Documents/gitRepos'
alias hm='cd /Users/robertsilverberg'
alias gs='git status'
alias dtup="cd ~/tempGitRepos/dotfiles; git add .; git commit -m 'updating dotfiles'; git push"
alias dtdn="cd ~/gitRepos/dotfiles; git pull"
export HISTCONTROL=erasedups

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





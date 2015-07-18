export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin
export PATH=~/.rakudobrew/bin:$PATH
export GREP_OPTIONS='--color=auto'
alias ls='ls -FG'

# Git prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Single_line_Ubuntu
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

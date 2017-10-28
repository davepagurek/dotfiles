export GOPATH=$HOME/Documents/Projects/Go
export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/bin:/usr/local/share/python:${PATH}"
export PATH="$HOME/android-sdk-macosx/platform-tools:${PATH}"
export PATH="/usr/local/texlive/2015basic/bin/universal-darwin:${PATH}"
export PATH="$HOME/node_modules/.bin:${PATH}"
export GREP_OPTIONS='--color=auto'
alias ls='ls --color'
alias vim='nvim'
alias vi='nvim'
alias fb='fb-messenger-cli'
alias gpm='google-music-electron'
alias uwssh='ssh dpagurek@ubuntu1604-008.student.cs.uwaterloo.ca -Y'

# Git prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"  ]; then
  #GIT_PROMPT_THEME=Single_line_Ubuntu
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

export PATH=$(echo $PATH | sed 's|/usr/local/bin||; s|/usr/local/sbin||; s|::|:|; s|^:||; s|\(.*\)|/usr/local/bin:/usr/local/sbin:\1|')

alias apachestart='brew services start httpd22'
alias apachestop='brew services stop httpd22'
alias apacherestart='brew services restart httpd22'

source ~/.profile
export PATH=~/.rakudobrew/bin:$PATH

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
export PATH="$(pyenv root)/shims:${PATH}"

export PATH="$HOME/.rvm/bin:$PATH"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

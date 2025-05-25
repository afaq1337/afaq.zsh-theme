# user, host, full path, branch and python venv on two lines for easier vgrepping

ZSH_THEME_VIRTUALENV_PREFIX="[%{$fg[magenta]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_color%}%B]%b"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} +"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✱"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[blue]%} ✈"
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}"

function mygit() {
  if [[ "$(git config --get oh-my-zsh.hide-status)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
    echo " %B[${ref#refs/heads/}$(git_prompt_short_sha)$( git_prompt_status )%{$reset_color%}%b%B]%b "
  fi
}

function retcode() {}

# alternate prompt with git & hg
PROMPT=$'%{\e[0;31m%}%B┌──💻 ($(whoami)@$(hostname -s) 🌐 $(ipconfig getifaddr en0 2>/dev/null || hostname -I | awk \'{print $1}\') ⏱ $(date "+%H:%M"))-[%{\e[1;34m%}📁 %~%{\e[0m%} | 🌿 $(mygit)%{\e[0;31m%}]\n└─λ %{\e[0m%}$(hg_prompt_info)$(virtualenv_prompt_info)%b'
PS2=$' \e[0;34m%}%B>%{\e[0m%}%b '

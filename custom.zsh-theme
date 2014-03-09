PROMPT='
$ZSH_CYAN%n: $ZSH_YELLOW$(get_pwd)$(put_spacing)$(git_prompt_info)
$ZSH_RESET → '

ZSH_CYAN="%{$fg[cyan]%}"
ZSH_YELLOW="%{$fg[yellow]%}"
ZSH_RED="%{$fg[red]%}"
ZSH_GREEN="%{$fg[green]%}"
ZSH_RESET="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]$ZSH_RESET"
ZSH_THEME_GIT_PROMPT_DIRTY="$ZSH_RED+"
ZSH_THEME_GIT_PROMPT_CLEAN="$ZSH_GREEN"

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

function put_spacing() {
  local git=$(git_prompt_info)
  if [ ${#git} != 0 ]; then
    ((git=${#git} - 18))
  else
    git=0
  fi
  local termwidth
  (( termwidth = ${COLUMNS} - 3 - ${#USER} - ${#$(get_pwd)} - ${git} ))
  local spacing=""
  for i in {1..$termwidth}; do
    spacing="${spacing} "
  done
  echo $spacing
}

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

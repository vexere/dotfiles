# general
export CLI_PATH="${HOME}"/cli # path to store downloaded cli tools

# mycli & pgcli
export PAGER='nvim -'

# tmux
export DISABLE_AUTO_TITLE='true' # tmuxp integration

# vim
export EDITOR='vim'
export TERM="xterm-256color"
export VIM_MODE="advance"
export VISUAL='vim'

# zfz
# use ag (the_silver_searcher) as default search
export FZF_DEFAULT_COMMAND="ag --path-to-ignore ~/.ignore --hidden -l -g ''"
# set color theme
# Press F1 to open the file with less without leaving fzf
# Press CTRL-Y to copy the line to clipboard without leaving fzf (requires xclip)
export FZF_DEFAULT_OPTS="--color=16 --bind 'f1:execute(less -f {}),ctrl-y:execute-silent(echo {} | xclip -selection c)'"

### EXTEND SECTION ###
# Below this section is configuration extened by script

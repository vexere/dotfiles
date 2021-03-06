# Store all aliases

# Pattern for alias naming
#
# pattern: <app>_<operations>_... - use '_' to separate letter and word for complex operation (readalibity is more important than shortcut)
#
# pattern: <app><feature> - alias with no action is mean to show information
# example: <docker><process>
# example: dkps="docker ps -a" - list running docker container
#
# pattern: replace current command to add more feature
# example: ping='ping -c 4'

# common_alias {
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias ls='ls --color=auto'
  alias l='ls --color=auto'
  alias grep='grep --color=auto'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  alias ls='ls -G'
  alias l='ls -G'
  export GREP_OPTIONS='--color=always'
  export GREP_COLOR='1;35;40'
fi
alias find=fd

alias chgrp='chgrp --preserve-root' # safety
alias chmod='chmod --preserve-root' # safety
alias chown='chown --preserve-root' # safety
alias cpu='lscpu'
alias evi="vi -u NONE"
alias mv="mv -v"
alias m="man"
alias now='date +"%d-%m-%Y %T"'
alias nowdate='date +"%d-%m-%Y"'
alias nowtime='date +"%T"'
alias open="xdg-open"
alias path='echo -e ${PATH//:/\\n}'
alias ping='ping -c 4'
alias ram="sudo lshw -short -C memory"
alias t="tldr -p linux"
alias wget="wget -c"

alias rn="rename" # ex: rename 's/{searchString}/{replaceString}/' *.sh
alias rndryrun="rename -n" # rename -n 's/{searchString}/{replaceString}/' *.sh
alias untargz="tar -xvzf"
alias targz="tar -cvzf"

if _is_service_exist "apt-fast"; then
    alias apt-get="apt-fast"
    alias aptins="apt-fast install --no-install-recommends -y"
fi

if _is_service_exist "fzf"; then
    alias fs="_fzf_find_in_files" # search text in files
    alias fm="_fzf_man"
    alias ft="_fzf_tldr"
        # ex: fs abc - search all files contain 'abc'
        # ex: fs abc vim - search all '.vim' files contain 'abc'
    alias ports="netstat -tulanp | fzf"
    alias psaux="ps aux | fzf"
else
    alias ports="netstat -tulanp"
    alias psaux="ps aux"
fi

if _is_service_exist "safe-rm"; then
    alias rm="safe-rm" # replace rm with safe-rm
else
    alias rm='rm --preserve-root' # safety
fi
# }

# desk {
if _is_service_exist "desk"; then
    alias d="desk"
    alias de="desk edit"
    alias dg="_desk" # desk go to desk setup
fi
# }

# docker {
if _is_service_exist "docker"; then
    alias dk="docker"
    alias dkim="docker images"
    alias dkps="docker ps"
    alias dke="docker exec -it"
    alias dk_rm_dangling_image="docker images -qf dangling=true | xargs -r docker rmi"
    alias dk_rm_dangling_volume="docker volume ls -qf dangling=true | xargs -r docker volume rm"
    alias dk_stop_all_ps="docker stop \$(docker ps -q)"
    alias dk_rm_all_ps="docker rm -fv \$(docker ps -aq)"
fi

if _is_service_exist "docker-compose"; then
    alias dc="docker-compose"
    alias dcb="docker-compose build --force-rm"
    alias dcu="docker-compose up -d --build"
fi
if _is_service_exist "lazydocker"; then
    alias lzd="lazydocker"
fi
# }

# nvm {
# though we can use zsh-nvm plugin, it would slow down the terminal startup time
# therefore only load it when needed is better for performance
alias loadnvm='[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'
# }

# tmux {
if _is_service_exist "tmux"; then
    alias tm="tmux"
    alias tmr="tmux source ~/.tmux.conf" # reload tmux session
    alias tmkill="tmux kill-session" # kill current tmux session
    alias tmkillall="tmux kill-server" # cleanly kill all sessions and running server
    # unbind all key (USE WITH CAUTION, use to remove cached bind-key)
    # note that all builtin bind key will be destroyed as well, should kill and restart tmux
    alias tmunbindallkeys="tmux unbind-key -a"
fi
if _is_service_exist "tmuxp"; then
    alias tmp="tmuxp"
    alias tmpl="tmuxp load"
fi
# }

# xinput {
declare builtinKeyboard="AT Translated Set 2 keyboard"
# Normal use of awk with alias will not run as expected, check for more detail on https://stackoverflow.com/a/24247870
alias _xinput_list_keyboard_id="xinput list | grep '${builtinKeyboard}' | awk '{print \$7}' | cut -c 4-5"
alias xinput_disable_keyboard="xinput float \$(_xinput_list_keyboard_id)"
# xinput reattach <id> <master> (master default to be 3)
# Check for more detail: https://askubuntu.com/questions/160945/is-there-a-way-to-disable-a-laptops-internal-keyboard
alias xinput_enable_keyboard="xinput reattach \$(_xinput_list_keyboard_id) 3"
# }

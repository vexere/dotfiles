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
alias ag="ag -i --pager=less"
alias chown='chown --preserve-root' # safety
alias chmod='chmod --preserve-root' # safety
alias chgrp='chgrp --preserve-root' # safety
alias cpu='lscpu'
alias mv="mv -v"
alias nowtime='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'
alias now='date +"%d-%m-%Y %T"'
alias open="xdg-open"
alias path='echo -e ${PATH//:/\\n}'
alias ping='ping -c 4'
alias ram="sudo lshw -short -C memory"
alias wget="wget -c"

if _is_service_exist apt-fast; then
    alias apt-get="apt-fast"
    alias aptins="apt-fast install --no-install-recommends -y"
fi

if _is_service_exist fzf; then
    alias ports='netstat -tulanp | fzf'
    alias psaux="ps aux | fzf"
else
    alias ports='netstat -tulanp'
    alias psaux="ps aux"
fi
# }

# docker {
if _is_service_exist docker; then
    # new kind of alias, better at history search
    alias dk="docker"
    alias dkexit="docker exec -it"
    alias dk_rm_dangling_image="docker images -qf dangling=true | xargs -r docker rmi"
    alias dk_rm_dangling_volume="docker volume ls -qf dangling=true | xargs -r docker volume rm"
    alias dk_stop_all_ps="docker stop \$(docker ps -q)"
    alias dk_rm_all_ps="docker rm -fv \$(docker ps -aq)"
fi

if _is_service_exist docker-compose; then
    alias dc="docker-compose"
    alias dcbuild="docker-compose build --force-rm"
    alias dcup="docker-compose up -d --build"
fi
# }

# gcloud {
if _is_service_exist gcloud; then
    alias gcompute="_g_compute"
    alias gsql="_g_sql"
    alias gservice="_g_service"
fi
if _is_service_exist kubectl; then
    alias k="kubectl"
    alias ks="k9s"
    alias kn="_k_nodes"
    alias kctx="kubectx" # switch kubernetes context
    alias kns="kubens" # switch namespace
fi
# }

# git {
if _is_service_exist git; then
    alias g="git"
fi
# }

# nvm {
# though we can use zsh-nvm plugin, it would slow down the terminal startup time
# therefore only load it when needed is better for performance
alias loadnvm='[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'
# }

# tmux {
if _is_service_exist tmux; then
    alias tm="tmux"
    alias tmkill="tmux kill-session"
fi
# }

# xinput {
declare builtinKeyboard="AT Translated Set 2 keyboard"
# Normal use of awk with alias will not run as expected, check for more detail on https://stackoverflow.com/a/24247870
alias _xinput_list_keyboard_id="xinput list | grep '${builtinKeyboard}' | awk '{print \$7}' | cut -c 4-5"
alias xinput_list_keyboard="xinput list"
alias xinput_disable_keyboard="xinput float '$(_xinput_list_keyboard_id)'"
# xinput reattach <id> <master> (master default to be 3)
# Check for more detail: https://askubuntu.com/questions/160945/is-there-a-way-to-disable-a-laptops-internal-keyboard
alias xinput_enable_keyboard="xinput reattach '$(_xinput_list_keyboard_id)' 3"
# }
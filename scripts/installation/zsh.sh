#!/usr/bin/env bash

. $(dirname ${BASH_SOURCE[0]})/../base/functions.sh

install_zsh () {
    apt-fast install --no-install-recommends -y zsh
    # Get prezto
    #_git_clone https://github.com/zimfw/zimfw.git ${ZDOTDIR:-${HOME}}/.zim

    # run this manually as dotbot does not support interactive command
    # chsh -s $(which zsh)
}

backup_zshrc () {
    # Backup zsh config if it exists
    if [ -f ~/.zshrc ]; then
        echo '> Backing up ~/.zshrc file to ~/.zshrc.backup'
        mv ~/.zshrc ~/.zshrc.backup
    fi
}

install_zplug () {
    # install plugin manager
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
}

main () {
    if ! _is_service_exist zsh; then
        echo 'zsh not installed. Installing zsh ...'
        install
    else
        echo '> zsh has already been installed.'
    fi

    backup_zshrc
    install_zplug
}

main

#!/usr/bin/env bash

# =====================================================================================================================
# LIBRARIES
# =====================================================================================================================

. $(dirname ${BASH_SOURCE[0]})/../base/functions.sh

# =====================================================================================================================
# FUNCTION
# =====================================================================================================================

install_nvim_linux() {
    sudo add-apt-repository -y ppa:neovim-ppa/stable
    sudo apt-get update -y
    apt-fast install --no-install-recommends -y neovim python-neovim python3-neovim ripgrep
}

install_nvim_macos() {
    brew install neovim
}

config () {
    # use Neovim for some (or all) of the editor alternatives, use the following commands
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
    sudo update-alternatives --config vi
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
    sudo update-alternatives --config vim
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
    sudo update-alternatives --config editor
}

plugin_linux() {
    # setup environment for vim plugins
    apt-fast install --no-install-recommends -y nodejs npm
    sudo npm install -g bash-language-server
}

plugin_macos() {
    # setup environment for vim plugins
    brew install node
    sudo npm install -g bash-language-server
}

main() {
    if ! _is_service_exist nvim; then
        case "$OSTYPE" in
            "linux-gnu"*)
                install_nvim_linux
                config
                plugin_linux
                ;;
            "darwin"*)
                install_nvim_macos
                plugin_macos
                ;;
            *)
                echo "Unsupported operating system: $OSTYPE"
                ;;
        esac

    fi
}

main

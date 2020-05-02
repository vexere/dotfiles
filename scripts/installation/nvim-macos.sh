#!/usr/bin/env bash

# =====================================================================================================================
# LIBRARIES
# =====================================================================================================================

. $(dirname ${BASH_SOURCE[0]})/../base/functions.sh

# =====================================================================================================================
# FUNCTION
# =====================================================================================================================

install () {
    brew install neovim
}

config () {
    # use Neovim for some (or all) of the editor alternatives, use the following commands
}

plugin() {
    # setup environment for vim plugins
    
}

main() {
    if ! _is_service_exist nvim; then
        install
        config
    fi
}

main

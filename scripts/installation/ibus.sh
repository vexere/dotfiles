#!/usr/bin/env bash

. $(dirname ${BASH_SOURCE[0]})/../base/functions.sh

install () {
    sudo add-apt-repository -y ppa:teni-ime/ibus-teni
    apt-fast install -y --no-install-recommends ibus ibus-teni

    # need a reboot
    # to setup vietnamese keyboard follow instruction on
    # * setup ibus as "Keyboard input method system" on language support
    # * setup new keyboard layout in "Ibus Preference"
    # https://github.com/teni-ime/ibus-teni/wiki/H%C6%B0%E1%BB%9Bng-d%E1%BA%ABn-c%E1%BA%A5u-h%C3%ACnh#1-keyboard-input-method-system-ibus
    # https://github.com/teni-ime/ibus-teni/wiki/H%C6%B0%E1%BB%9Bng-d%E1%BA%ABn-c%E1%BA%A5u-h%C3%ACnh#2-add-an-input-source-vietnameseteni
}

main () {
    if ! _is_service_exist ibus; then
        install
    fi
}

main

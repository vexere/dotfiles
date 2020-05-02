#!/usr/bin/env bash

. $(dirname ${BASH_SOURCE[0]})/../base/functions.sh

declare PET_VERSION="0.3.6"
declare DOTFILES="${HOME}/dotfiles"

install_linux () {
    # Add the Cloud SDK distribution URI as a package source
    echo "deb http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

    # Import the Google Cloud Platform public key
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

    # Update the package list and install the Cloud SDK
    sudo apt-get update && apt-fast install --no-install-recommends -y google-cloud-sdk
}

install_macos () {
    local version="290.0.1-darwin-x86_64"
    local file="google-cloud-sdk-$version.tar.gz"
    local url="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-$version.tar.gz"
    local tmpDir="/tmp/gcloud"
    local destDir="${HOME}/.gcloud"

    curl -L $url --create-dirs -o $tmpDir/$file # download compressed files

    mkdir -p $destDir
    tar xvf $tmpDir/$file -C $destDir # extract
    rm -r $tmpDir # remove tmp dir

    # Install gcloud to PATH
    $destDir/google-cloud-sdk/install.sh # need to input interactive answer
    # TODO: disable interactive answer
    
    # Log in to gcloud account and choose project to start working
    gcloud init

    # gcloud components install kubectl # don't know why kubectl is installed already
}

main () {
    if ! _is_service_exist gcloud; then
        if [[ "$OSTYPE" == "linux-gnu" ]]; then
            echo "Installing gcloud sdk on Linux..."
            install_linux
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            # Mac OSX
            echo "Installing gcloud sdk on MacOS..."
            install_macos
        fi
    fi
}

main

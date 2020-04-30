# Introduction
While the project has the name dotfiles it contains not only dotfiles for configuration but also application installation scripts to automate development tool seting up.

This script is a result of many years working with Linux-based environment, many years of using git, docker and many other nice tools that boost engineer performance an order of magnitude. Many part of this scripts are also results of relentless work of opensource community. We believe that by looking through this script, many can learn a lot about the tools, the possible or most common usage features of tools.

- Use [dotbot](https://github.com/anishathalye/dotbot) dotfiles manager to manage dotfiles environment
- Use zplug as a package management for zsh shell
- Take care about bash startup time from the beginning, there are minimal of zsh plugins enabled by default. Also there is zprof plugin to profile zsh startup time so you can uncomment plugins or add more plugins while monitoring performance carefully.

For features in development please see Roadmap section below.

# Require

* git
* apt-fast

# Usage
Customization: TBD

## Docker
There's a docker setup to try out the tools and config.
* run `docker-compose up -d ubuntu` to start the container
* run `docker exec -it dotfiles_ubuntu_1 /bin/sh` to start a new shell in container
* then you can try to run the install script and play with the config

## Installation
There are four mode of installation.
1. Install application & configuration by profile
A profile includes a set of tools, for instance terminal profile includes zsh, git, tmux and nvim (see meta/profiles/terminal).

For all available profile and its packages please see What's in it section below, or check meta/profiles folder.

`./install-profile <profile> [<configs...>]` `Ex: ./install-profile terminal`

2. Install just one application & configuration at a time
Install single package (install 1 module at a time: check meta/configs for supported package)
`./install-standalone <configs...>` `Ex: ./install-standalone nvim`

3. Install only configuration file by profile

4. Install only configuration file for each application

`./install-profile default` should be run (to make sure that script files are granted the proper permission to run)
* before the first installation
* and everytime a new install script is added

## Custom script & binary

* Custom zsh files will be automatically available if placed in `~/.project/`
* Custom binary files will be automatically available if placed in `~/bin`

# What's in it?
Packages are divided into profiles
## terminal profile
- zsh: the Z shell, better functionalit than GNU Bash. More information here https://en.wikipedia.org/wiki/Z_shell
- zsh-nvm: not load on zsh startup to decrease startup time. To load nvm use alias loadnvm
- zplug: zsh package manager. For more information please see here https://github.com/zplug/zplug
- git: git & git alias, tig
- tmux: terminal multiplexer. This could be used together with iterm2 (MacOS) or terminator (MacOS/Linux)
- nvim: an extensible vim. Also set alias vi and vim to nvim after installation
## dev profile
- docker
- java
- nodejs: install lts versions by using nvm
## home profile
- ibus
- gui_general

## kube-terminal profile
Support kubernete & a lot of useful tools to boost your devops performance.
- kubectl
- kubectx
- k9s

# Supported alias
## git
## kubernetes
## docker
## extract / archive

# Roadmap
## Test script on different environments
- [x] Ubuntu
- [x] MacOS Catalina
- [ ] MacOS earlier than Catalina
- [ ] Redhat
- [ ] CentOS
- [ ] Linux Subsystem on Windows
## Installation mode
- [ ] Support selection of tools to be installed (for example zsh already installed on MacOS)
- [ ] Install only configuration file by profile
- [ ] Install only configuration file for each application
## Add more alias
- [ ] git alias
- [ ] Add docker alias
- [ ] alias for awk and sed, jq for more natural thought process instead of having to remember awk / sed, while these tools are profoudly convenient
- [ ] alias to work with csv file
- [ ] node, nvm, npm, yarn alias
- [ ] ruby alias
- [ ] python alias
- [ ] alias to work with db cli such as sql server, psql, mongo, redis, ...
- [ ] Add installation for gcloud & configuration
## Allow customization
- [ ] Add or modify your own alias
- [ ] Customize zsh / vim / any application settings
## Documentation
- [ ] What do we need to do after installation?

# Contributors
This project owns a lot to Minh Pham (https://github.com/hminh0407/dotfiles) as original contributor. He did trenmendous work for project structure and automation scripts.

We welcome feedback and contributions to make this project a starting place for every engineer.
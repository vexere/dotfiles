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

Alias is complicated, especially when it comes to different tastes of every single developer.
Also when there are many tools, there are high chances for alias to be conflict with each other.
That is why we have strived our best to provide opinionated alias while still allow customization.
The true beauty is it not only allow to redefine alias but also allow to choose alias prefix at easy.

Alias are defined by application.

It is recommended to fork this project so all your preferences or customization could be managed properly.

To encourage anyone to custom alias per their own preference, we have divided alias configuration into two files. Each application includes an `<application_name>alias` and `<application_name>alias-base` file. These files are linked to `~/.dotfiles/.<application_name>alias` and `~/.dotfiles/.<application_name>alias-base` and are included in `~/.zshrc` file when installing (linked to zsh/zshrc file in this repo).
- `<application_name>alias`: do your customization here
- `<application_name>alias-base`: should be maintained by our team, avoid to modify this file unless it is necessary. We also welcome any idea to improve scripts to be better day by day so don't hesitate to push a merge request to our repo.

To add more alias or update, make change to `<application_name>alias` file and run `source ~/.zshrc`.

For instance, alias for git could be found in `git` folder.
`git` also supports alias for its commands so you will find another two files `git-integrated-alias` and `git-integrated-alias-base`.

Some tips for alias:
- Alias for `git` is `g`, to choose another such as `gt` try to change `GIT_ALIAS_PREFIX` in `gitalias` file to `gt`
- To show current `git` alias prefix try command `gitaliasprefix`. Similar for all other tools, such as `kubectlaliasprefix`, `npmaliasprefix` ...

## git
git alias is defined in git/gitconfig file.
alias g=git (defined in aliases.sh)

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
- [ ] Add installation for cloud toosl: gcloud, aws, s3, heroku, digital ocean & configuration
## Add IDE settings
- [ ] Visual Studio Code
- [ ] Webstorm
## Add more tools
- [ ] Add fzf tool
## Allow customization
- [ ] Add or modify your own alias
- [ ] Customize zsh / vim / any application settings
## alias conflict detection & prevention
- [ ] Dry run through alias to see if there existed alias with the same name 
- [ ] Allow add prefix to default alias to prevent conflict (for example kk instead of k for kubectl, gt instead of g for git, ...)
## Documentation
- [ ] What do we need to do after installation?

# Contributors
This project owns a lot to Minh Pham (https://github.com/hminh0407/dotfiles) as original contributor. He did trenmendous work for project structure and automation scripts.

We welcome feedback and contributions to make this project a starting place for every engineer.
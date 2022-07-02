#!/usr/bin/env bash
#-------------------------------------------------------------------------------------------------------------
#
#-------------------------------------------------------------------------------------------------------------
#
# Docs: https://ohmyposh.dev/docs/linux
# Maintainer: Nahlian
#
# Syntax: ./shell.sh

sudo -u vscode bash -c '\
    sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
    sudo chmod +x /usr/local/bin/oh-my-posh 
    mkdir ~/.poshthemes
    wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
    unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
    chmod u+rw ~/.poshthemes/*.json
    rm ~/.poshthemes/themes.zip |\
    bash
'
sudo -u vscode bash -c '\
    mkdir -p ~/.local/share/fonts
    sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip -O /tmp/library-scripts/CascadiaCode.zip
    cd /tmp/library-scripts 
    sudo unzip CascadiaCode.zip -d ~/.local/share/fonts
    bash
'
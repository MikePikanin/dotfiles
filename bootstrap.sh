#!/bin/bash

apt_install(){
    dpkg -s $1 &> /dev/null && echo "SKIP: $1 already installed" || sudo apt -y install $1
}

declare -a AptPackages=("fd-find" "htop" "ripgrep")
for val in ${AptPackages[@]}; do
   apt_install $val
done

# fd-find -> fd
if [ ! $(type -P fd) ]; then
    local local_bin = $HOME/.local/bin
    mkdir -p $local_bin
    if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bashrc
        . $HOME/.bashrc
    fi
    ln -s $(which fdfind) $local_bin/fd
else
    echo SKIP: fd already exists
fi

# FZF installation
if [ ! -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
else
    echo SKIP: FZF already installed
fi

echo DONE

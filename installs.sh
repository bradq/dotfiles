
#!/bin/bash

set -e
mkdir -p "${HOME}/code"

# Sudoers
sudo su -c 'echo "${USER}       ALL=(ALL)	NOPASSWD: ALL " > "/etc/sudoers.d/${USER}"'

# We want a key! 
if ! [ -f ~/.ssh/id_rsa ]; then
     mkdir -p ~/.ssh
     chmod 0700 ~/.ssh
     ssh-keygen -b 4096 -f ~/.ssh/id_rsa
fi

# Yum config
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Base install packages. 
sudo dnf -y install dropbox \
	dnf-plugins-core \
	gnome-tweak-tool \
	python-pip \
	vim \
	vlc \
	zsh \
	xorg-x11-drv-synaptics

# Docker!
    sudo dnf config-manager \
        --add-repo \
        https://download.docker.com/linux/fedora/docker-ce.repo

    sudo dnf install docker-ce docker-ce-cli containerd.io
    sudo usermod ${USER} -g docker


# Install base pip packages
sudo pip install -U pip
pip install awscli --user

# Setup dotfiles
if ! [ -d ~/code/dotfiles ]; then
  git clone https://github.com/bradq/dotfiles.git ~/code/dotfiles
fi

# zsh!
if [[ `echo $0` != "zsh" ]]; then
    chsh -s $(which zsh)
fi

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Link dotfiles
for i in `ls -a ~/code/dotfiles/dotfiles`; do
if ! [ -L "$HOME/$i" ]; then
    test -f "i" && mv -f "$i" "$i"-backup-`date +%s`
    ln -s ~/code/dotfiles/ ~/.vimrc
fi



# Setup .idea files


# Git config
git config --global user.name "Brad Quellhorst"

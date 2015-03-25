#!/bin/bash

# Install files and setups
sudo apt-get install -y zsh git vim ack-grep exuberant-ctags tmux mosh rake
sudo gem install homesick

# Install Janus
curl -Lo- https://bit.ly/janus-bootstrap | bash

# Install dotfiles
homesick clone cmol/dotfiles
homesick link dotfiles

# Install rbenv
git clone git://github.com/sstephenson/rbenv.git .rbenv
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone git://github.com/jf/rbenv-gemset.git ~/.rbenv/plugins/rbenv-gemset

# Change shell to zsh
chsh -s $(which zsh)

# Things to run locally only
if [[ -z "$SSH_CLIENT" ]]; then
  # Create dirs
  mkdir -p ~/bin
  cd ~/bin

  # Setup gnome-terminal
  git clone git@github.com:sigurdga/gnome-terminal-colors-solarized.git
  cd gnome-terminal-colors-solarized
  ./set_dark.sh

  # Install poweline fonts
  mkdir ~/.fonts
  cd ~/.fonts
  wget --no-check-certificate https://github.com/Lokaltog/powerline-fonts/raw/master/Inconsolata/Inconsolata%20for%20Powerline.otf -O InconsolataForPowerline.otf

  # List ruby-versions
  exec $SHELL
  rbenv install --list
fi

#!/bin/bash

# Install files and setups
sudo apt-get install -y zsh git vim ack-grep exuberant-ctags tmux mosh rake curl most powerline
sudo gem install homesick

# Install Janus
cd ~/.vim/janus || curl -Lo- https://bit.ly/janus-bootstrap | bash

# Install dotfiles
homesick clone cmol/dotfiles
homesick link dotfiles

# Install rbenv
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv || echo "[rbenv] Already installed. Updating..."; cd ~/.rbenv ; git pull --rebase
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build || cd ~/.rbenv/plugins/ruby-build ; git pull --rebase
git clone git://github.com/jf/rbenv-gemset.git ~/.rbenv/plugins/rbenv-gemset || ~/.rbenv/plugins/rbenv-gemset ; git pull --rebase

# Create dirs
mkdir -p ~/bin

# Clone repos
cd ~/bin
git clone git@github.com:powerline/powerline.git || echo "[powerline] Already downloaded. Updating..."; cd powerline; git pull --rebase; cd ..

# Things to run locally only
if [[ -z "$SSH_CLIENT" ]]; then

  # Setup gnome-terminal
  git clone git@github.com:sigurdga/gnome-terminal-colors-solarized.git || echo "[gnome-terminal-colors-solarized] Already downloaded. Updating..."; cd gnome-terminal-colors-solarized ; git pull --rebase; cd ..

  cd gnome-terminal-colors-solarized
  ./set_dark.sh

  # Install poweline fonts
  mkdir ~/.fonts
  cd ~/.fonts
  wget --no-check-certificate https://github.com/Lokaltog/powerline-fonts/raw/master/Inconsolata/Inconsolata%20for%20Powerline.otf -O InconsolataForPowerline.otf
  echo "Please change to a powerline font in your terminal.."
fi

# Change shell to zsh
sudo chsh -s $(which zsh) $USER && echo "Shell changed. You may need to log out and log in again for this to take effect."

# List ruby-versions
exec $SHELL
rbenv install --list

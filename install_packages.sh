#!/usr/bin/bash
sudo apt install -y zoxide
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
sudo apt install -y ripgrep
sudo apt install -y fd-find

sudo apt install -y bat
sudo ln -s /usr/bin/batcat /usr/bin/bat
sudo apt install -y exa

# Shell
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Terminal
sudo apt install -y wezterm
sudo update-alternatives --config x-terminal-emulator


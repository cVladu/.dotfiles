#!/usr/bin/bash
sudo snap install nvim --classic
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
sudo apt install -y ripgrep
sudo apt install -y fd-find
sudo apt install -y thefuck

sudo apt install -y bat
sudo ln -s /usr/bin/batcat /usr/bin/bat
sudo apt install -y exa

# Shell
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Terminal
sudo apt install -y wezterm
sudo update-alternatives --config x-terminal-emulator


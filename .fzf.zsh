# Setup fzf
# ---------
if [[ ! "$PATH" == */home/cvladu/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/cvladu/.fzf/bin"
fi

eval "$(fzf --zsh)"

# Setup fzf
# ---------
if [[ ! "$PATH" == */home/cvladu/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/cvladu/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/cvladu/.fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/home/cvladu/.fzf/shell/key-bindings.zsh"

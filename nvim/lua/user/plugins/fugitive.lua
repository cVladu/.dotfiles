return {
  "https://github.com/tpope/vim-fugitive",
  keys = {
    { "<leader>gg", "<cmd>:Git<cr>",         desc = "fugitive: Open git status" },
    { "<leader>gB", "<cmd>:Git blame<cr>",   desc = "fugitive: Open git blame" },
    { "<leader>gc", "<cmd>:Git commit<cr>",  desc = "fugitive: Open git commit" },
    { "<leader>gd", "<cmd>:Gdiffsplit<cr>", desc = "fugitive: Open git diff" },
    { "<leader>gl", "<cmd>:Gclog<cr>",      desc = "fugitive: Open git log" },
  }
}

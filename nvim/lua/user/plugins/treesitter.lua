return {
  { "nvim-treesitter/nvim-treesitter", -- treesitter: Better highlighting
    config = function()
      require 'nvim-treesitter.configs'.setup {
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },
  "nvim-treesitter/nvim-treesitter-context", -- tresitter context
}

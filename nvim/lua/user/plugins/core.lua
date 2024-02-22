-- Include plugins that do require low to no configuration
return {
  "nvim-treesitter/nvim-treesitter",         -- treesitter: Better highlighting
  "nvim-treesitter/nvim-treesitter-context", -- tresitter context
  "nvim-telescope/telescope-ui-select.nvim",
  "wellle/context.vim", -- context: see the context when scrolling
  {
    "github/copilot.vim",
    config = function()
      vim.keymap.set('i', '<C-CR>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false
      })
      vim.g.copilot_no_tab_map = true
    end
  },
  {
    "hrsh7th/cmp-copilot",
    after = { "copilot.lua" },
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end
  },
  {
    "ggandor/leap-spooky.nvim",
    dependencies = { "wellle/context.vim" },
    config = true
  },
}

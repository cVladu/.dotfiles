-- Include plugins that do require low to no configuration
return {
  "nvim-telescope/telescope-ui-select.nvim",
  {
    "github/copilot.vim",
    config = function()
      vim.keymap.set('i', '<C-y>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false
      })
      vim.g.copilot_no_tab_map = true
    end
  },
  {
    "hrsh7th/cmp-copilot",
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

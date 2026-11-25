-- Include plugins that do require low to no configuration
return {
  "nvim-telescope/telescope-ui-select.nvim",
  -- {
  --   "github/copilot.vim",
  --   config = function()
  --     vim.keymap.set('i', '<C-y>', 'copilot#Accept("\\<CR>")', {
  --       expr = true,
  --       replace_keycodes = false
  --     })
  --     vim.g.copilot_no_tab_map = true
  --   end
  -- },
  -- {
  --   "hrsh7th/cmp-copilot",
  -- },
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({
        enable_chat = true
      })
    end
  },
  {
    url = "https://codeberg.org/andyg/leap.nvim",
    config = function()
      vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
      vim.keymap.set('n', 'S', '<Plug>(leap-from-wingow)')
      local default_text_objects = {
        'iw', 'iW', 'is', 'ip', 'i[', 'i]', 'i(', 'i)', 'ib',
        'i>', 'i<', 'it', 'i{', 'i}', 'iB', 'i"', 'i\'', 'i`',
        'aw', 'aW', 'as', 'ap', 'a[', 'a]', 'a(', 'a)', 'ab',
        'a>', 'a<', 'at', 'a{', 'a}', 'aB', 'a"', 'a\'', 'a`',
      }
      -- Create remote versions of all native text objects by inserting `r`
      -- into the middle (`iw` becomes `irw`, etc.):
      for _, tobj in ipairs(default_text_objects) do
        vim.keymap.set({'x', 'o'}, tobj:sub(1,1)..'r'..tobj:sub(2), function ()
          require('leap.remote').action { input = tobj }
        end)
      end
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts) require 'lsp_signature'.setup(opts) end
  },
    {
    "lmgraf/wsl-clipboard.nvim",
    opts = {
      mode = "sync", -- options: "system", "sync", "focus"
    },
  },
}

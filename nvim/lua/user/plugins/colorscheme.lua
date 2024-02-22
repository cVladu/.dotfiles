return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require('lualine').setup {
        options = {
          theme = "nightfly",
        }
      }
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        term_colors = true,
        no_italic = true,
        no_bold = true,
        no_underline = false,
        styles = {
          sidebar = "dark",
          floats = "dark",
        },
        color_overrides = {
          all = {
            text = "#91e0ce",
          }
        },
        integrations = {
          cmp = true,
          nvimtree = true,
          treesitter = true,
          harpoon = true,
          mason = true,
          telescope = {
            enabled = true
          },
        }
      })
      vim.cmd.colorscheme "catppuccin"
    end
  }
}

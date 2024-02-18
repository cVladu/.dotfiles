return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      actions = {
        open_file = {
          quit_on_open = true,
        }
      },
      renderer = {
        highlight_git = true,
        highlight_diagnostics = true,
        highlight_opened_files = "icon",
        highlight_modified = "none",
        highlight_bookmarks = "none",
        highlight_clipboard = "name",
      },
      view = {
        side = "right",
        number = true,
        relativenumber = true,
      }
    })
    vim.keymap.set('n', '<leader>e', require("nvim-tree.api").tree.toggle, opts)
  end,
}

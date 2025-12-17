return {
  "numToStr/Comment.nvim", -- comment: Better comments
  config = function()
    require("Comment").setup({
      mappings = {
        basic = false,
        extra = false,
      }
    })
    local comment_api = require("Comment.api")
    local esc = vim.api.nvim_replace_termcodes(
      '<ESC>', true, false, true
    )

    vim.keymap.set("n", "<leader>kk", comment_api.toggle.linewise.current)
    vim.keymap.set("n", "<leader>kc", comment_api.comment.linewise.current)
    vim.keymap.set("n", "<leader>ku", comment_api.uncomment.linewise.current)

    vim.keymap.set('x', '<leader>kk', function()
      vim.api.nvim_feedkeys(esc, 'nx', false)
      comment_api.toggle.linewise(vim.fn.visualmode())
    end)
    vim.keymap.set('x', '<leader>kc', function()
      vim.api.nvim_feedkeys(esc, 'nx', false)
      comment_api.comment.linewise(vim.fn.visualmode())
    end)
    vim.keymap.set('x', '<leader>ku', function()
      vim.api.nvim_feedkeys(esc, 'nx', false)
      comment_api.uncomment.linewise(vim.fn.visualmode())
    end)
  end
}

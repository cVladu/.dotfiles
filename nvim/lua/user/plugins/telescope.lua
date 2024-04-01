return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim", {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    config = function()
      require('telescope').load_extension('fzf')
    end
  }
  },
  config = function()
    require("telescope").setup({
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case"
        }
      }
    })

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader><leader>", builtin.resume)
    -- Fuzzy finders
    vim.keymap.set("n", "<leader>pf", function() builtin.find_files({hidden=true, no_ignore=true, no_ignore_parent=true}) end, {})
    vim.keymap.set("n", "<leader>sp", builtin.live_grep, {})
    vim.keymap.set({ "n", "v" }, "<leader>sw", function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set({ "n", "v" }, "<leader>sW", function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, {})
    -- Lists
    vim.keymap.set("n", "<leader>lm", builtin.marks, {})
    vim.keymap.set("n", "<leader>lr", builtin.registers, {})
    vim.keymap.set("n", "<leader>lj", builtin.jumplist, {})
    vim.keymap.set("n", "<leader>ld", function() builtin.diagnostics({ bufnr = 0 }) end, {})
    vim.keymap.set("n", "<leader>lD", function() builtin.diagnostics({ bufnr = nil }) end, {})
    -- Git
    vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
    vim.keymap.set("n", "<leader>lgc", builtin.git_commits, {})
    vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
    -- Wrap preview window
    vim.api.nvim_create_autocmd("User", {
      pattern = "TelescopePreviewerLoaded",
      callback = function(args)
        vim.wo.number = true
        vim.wo.wrap = true
      end,
    })
  end
}

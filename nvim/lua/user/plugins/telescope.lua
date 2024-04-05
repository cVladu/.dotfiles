return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { 
    "nvim-lua/plenary.nvim", 
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  config = function()
    local lga_actions = require("telescope-live-grep-args.actions")
    require("telescope").setup({
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case"
        },
        live_grep_args = {
          auto_quoting = true,
          mappings = {
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-h>"] = lga_actions.quote_prompt({ postfix = " --hidden " }),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --no-ignore " }),
            },
            n = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-h>"] = lga_actions.quote_prompt({ postfix = " --hidden " }),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --no-ignore " }),
            }
          }
        }
      }
    })
    require('telescope').load_extension('fzf')
    require("telescope").load_extension("live_grep_args")
    local builtin = require("telescope.builtin")
    local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
    vim.keymap.set("n", "<leader><leader>", builtin.resume)
    -- Fuzzy finders
    vim.keymap.set("n", "<leader>pf", function() builtin.find_files({hidden=true, no_ignore=true, no_ignore_parent=true}) end, {})
    vim.keymap.set("n", "<leader>sp", require('telescope').extensions.live_grep_args.live_grep_args, {})
    vim.keymap.set("n", "<leader>sw", live_grep_args_shortcuts.grep_word_under_cursor, {})
    vim.keymap.set("v", "<leader>sw", live_grep_args_shortcuts.grep_visual_selection, {})
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

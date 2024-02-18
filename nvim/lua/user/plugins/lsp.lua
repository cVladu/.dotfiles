return {
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "nvim-telescope/telescope.nvim", "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
      -- Add additional capabilities supported by nvim-cmp
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require('lspconfig')
      -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
      local servers = {'clangd', 'pyright', 'bashls', 'rust_analyzer'}
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          -- on_attach = my_custom_on_attach,
          capabilities = capabilities,
        }
      end

      -- Custom lsp configurations
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        settings = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }


      -- Global mappings.

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          telescope_builtin = require("telescope.builtin")

          local opts = { buffer = ev.buf }
          -- Definitions and implementations
          vim.keymap.set('n', 'gd', telescope_builtin.lsp_definitions, opts)
          vim.keymap.set('n', 'gi', telescope_builtin.lsp_implementations, opts)
          vim.keymap.set("n", 'gr', telescope_builtin.lsp_references, opts)
          vim.keymap.set('n', '<leader>D', telescope_builtin.lsp_type_definitions, opts)
          -- Some things??
          vim.keymap.set("n", "<leader>ls", telescope_builtin.lsp_document_symbols, opts)
          vim.keymap.set("n", "<leader>lS", telescope_builtin.lsp_workspace_symbols, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          -- Workspace management
          vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          -- Formating
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    end
  }
}

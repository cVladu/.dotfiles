return {
  "theHamsta/nvim-dap-virtual-text",
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      local dapui = require('dapui')
      local dap = require('dap')
      dapui.setup()

      vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='@text.danger', numhl=''})
      vim.fn.sign_define('DapStopped', {text='→', texthl='', linehl='@text.note', numhl=''})
      -- MasonMutedBlockBold
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      vim.keymap.set("n", "<leader>bp", dap.toggle_breakpoint)
      vim.keymap.set("n", "<leader>so", dap.step_over)
      vim.keymap.set("n", "<leader>si", dap.step_into)
      vim.keymap.set("n", "<leader>sO", dap.step_out)
      vim.keymap.set("n", "<leader>c", dap.continue)
      vim.keymap.set("n", "<leader>r", dap.restart)
      vim.keymap.set("n", "<leader>st", dap.terminate)
      vim.keymap.set("n", "<leader>dr", dap.repl.toggle)

      dap.adapters.python = {
        type = 'executable',
        command = 'python',
        args = { '-m', 'debugpy.adapter' },
      }

      dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            return 'python'
          end,
        },
      }

      require('dap.ext.vscode').load_launchjs()
    end
  }
}

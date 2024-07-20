return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  lazy = true,
  keys = { "<leader>dd", "<leader>db", "<leader>dc", "<leader>ds" },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Initialize dap-ui
    dapui.setup()

    -- Python adapter setup
    dap.adapters.python = {
      type = "executable",
      command = "python",
      args = { "-m", "debugpy.adapter" },
    }

    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          local venv_path = os.getenv("VIRTUAL_ENV")
          if venv_path then
            return venv_path .. "/bin/python"
          else
            return "python"
          end
        end,
      },
    }

    -- Open dap-ui automatically
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- Setup key mappings to load nvim-dap lazily
    vim.api.nvim_set_keymap("n", "<leader>dd", "", {
      noremap = true,
      silent = true,
      callback = function()
        dap.continue()
      end,
    })

    vim.api.nvim_set_keymap("n", "<leader>db", "", {
      noremap = true,
      silent = true,
      callback = function()
        dap.toggle_breakpoint()
      end,
    })

    vim.api.nvim_set_keymap("n", "<leader>dc", "", {
      noremap = true,
      silent = true,
      callback = function()
        dap.run_to_cursor()
      end,
    })

    vim.api.nvim_set_keymap("n", "<leader>ds", "", {
      noremap = true,
      silent = true,
      callback = function()
        dap.step_over()
      end,
    })
  end,
}

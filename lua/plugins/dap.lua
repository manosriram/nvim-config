return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap-python",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

			-- Add to config function after dapui.setup()
			local dap_python = require('dap-python')
			dap_python.setup('/opt/homebrew/bin/python') -- or specify path to python with debugpy installed

			-- Optional: Add Python-specific keymaps
			vim.keymap.set('n', '<leader>dn', function() dap_python.test_method() end)
			vim.keymap.set('n', '<leader>df', function() dap_python.test_class() end)

      -- Setup dap-ui
      dapui.setup()



      -- Auto open/close dap-ui
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Key mappings
      vim.keymap.set('n', '<Leader>dc', function() dap.continue() end, { desc = "Debug: Continue" })
      vim.keymap.set('n', '<Leader>so', function() dap.step_over() end, { desc = "Debug: Step Over" })
      vim.keymap.set('n', '<Leader>si', function() dap.step_into() end, { desc = "Debug: Step Into" })
      vim.keymap.set('n', '<Leader>sO', function() dap.step_out() end, { desc = "Debug: Step Out" })
      vim.keymap.set('n', '<Leader>db', function() dap.toggle_breakpoint() end, { desc = "Debug: Toggle Breakpoint" })
      vim.keymap.set('n', '<Leader>dB', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = "Debug: Set Conditional Breakpoint" })
      vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end, { desc = "Debug: Open REPL" })
      vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end, { desc = "Debug: Run Last" })
      vim.keymap.set('n', '<Leader>du', function() dapui.toggle() end, { desc = "Debug: Toggle UI" })

			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = "codelldb",
					args = { "--port", "${port}" },
				},
			}

			-- setup a debugger for zig projects
			dap.configurations.zig = {
				{
					name = 'Launch',
					type = 'codelldb',
					request = 'launch',
					program = '${workspaceFolder}/zig-out/bin/recursive_descent_parser',
					cwd = '${workspaceFolder}',
					stopOnEntry = false,
					args = {},
				},
			}

			dap.adapters.java = {
				type = 'server',
				host = '127.0.0.1',
				port = 5005,
				timeout = 20000
			}

			dap.configurations.java = {
				{
					type = 'java',
					request = 'attach',
					name = "Debug (Attach) - Remote",
					hostName = "127.0.0.1",
					port = 5005,
				},
				{
					type = 'java',
					request = 'launch',
					name = "Debug (Launch) - Current File",
					mainClass = "${file}",
					projectName = "${workspaceFolderBasename}",
				}
			}
		end,
	},
}

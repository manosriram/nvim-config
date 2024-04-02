-- for go programs, start the dlv debugger using `dlv debug --headless` when inside the project

return {
		"mfussenegger/nvim-dap",
		dependencies = {
				"nvim-neotest/nvim-nio",
				"rcarriga/nvim-dap-ui",
				"mfussenegger/nvim-dap-python",
				"leoluz/nvim-dap-go",
				"mrcjkb/rustaceanvim",
		},
		config = function()
				local dap = require("dap")
				local dapui = require("dapui")

				dapui.setup()

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

				vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
				vim.keymap.set("n", "<Leader>dc", dap.continue, {})
				vim.keymap.set("n", "<Leader>di", dap.step_into, {})
				vim.keymap.set("n", "<Leader>do", dap.step_over, {})
				vim.keymap.set("n", "<Leader>dO", dap.step_over, {})
				vim.keymap.set("n", "<Leader>dr", dap.repl.open, {})

				require('dap-go').setup()
				require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
		end
}

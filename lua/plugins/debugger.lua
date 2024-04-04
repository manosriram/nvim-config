-- for go programs, start the dlv debugger using `dlv debug --headless` when inside the project

return {
		"mfussenegger/nvim-dap",
		dependencies = {
				"nvim-neotest/nvim-nio",
				"rcarriga/nvim-dap-ui",
				"mfussenegger/nvim-dap-python",
				"leoluz/nvim-dap-go",
				{ "simrat39/rust-tools.nvim",
						config = function()
							dap = {
								adapter = {
									type = "executable",
									command = "lldb",
									name = "rt_lldb"
								}
							}
						end
				}
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

						
				local rt = require("rust-tools")
				local mason_registry = require("mason-registry")

				local codelldb = mason_registry.get_package("codelldb")
				local extension_path = codelldb:get_install_path() .. "/extension"
				local codelldb_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb"
				local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

				dap.adapters.lldb = {
						type = "server",
						port = "${port}",
						executable = {
								command = codelldb_path,
								args = { "--port", "${port}" },
								detached = false,
								stopOnEntry = false
						}
				}

				rt.setup({
						dap = {
								adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
						},
						server = {
								capabilities = require("cmp_nvim_lsp").default_capabilities(),
								-- on_attach = function(_, bufnr)

								-- end
						},
						tools = {
								hover_actions = {
										auto_focus = true,
								}
						}
				})

				dap.configurations.rust = {
						{
								name = "Debug an Executable",
								type = "lldb",
								request = "launch",
								program = function()
										return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/', "file")
								end,
								cwd = "${workspaceFolder}",
								stopOnEntry = false,
								showDisassembly = false
						}
				}
		end
}

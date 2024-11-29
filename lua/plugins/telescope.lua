return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},

	config = function()
		local actions = require("telescope.actions")
		require('telescope').setup({
			defaults = {
				layout_strategy = "vertical",
				mappings = {
					i = {
						["<esc>"] = actions.close
					}
				}
			}
		})

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
		vim.keymap.set('n', '<C-p>', builtin.git_files, {})
		vim.keymap.set('n', '<leader>ws', function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set('n', '<leader>Ws', function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set('n', '<leader>ps', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
	end
}

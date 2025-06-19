return {
	"nvim-telescope/telescope.nvim",
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
		vim.keymap.set('n', '<Leader>F', builtin.git_files, {})
		vim.keymap.set('n', '<Leader>f', builtin.find_files, {})
		vim.keymap.set('n', '<Leader>b', builtin.buffers, {})
		vim.keymap.set("n", "<leader>G", function ()
				builtin.grep_string({ search = vim.fn.input("Grep > ") });
		end)
		vim.keymap.set('n', '<Leader>H', builtin.help_tags, {})
	end
}

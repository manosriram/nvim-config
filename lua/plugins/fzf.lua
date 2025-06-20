return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
	config = function()
		require("fzf-lua").setup({
			winopts = {
				preview = {
					layout = "vertical",
					vertical = "up"
				}
			}
		})
		vim.keymap.set('n', '<Leader>f', ":FzfLua files<CR>")
	end
}

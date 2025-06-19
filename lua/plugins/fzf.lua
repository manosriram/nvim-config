return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
	config = function()
		vim.keymap.set('n', '<Leader>f', ":FzfLua files<CR>")
	end
}

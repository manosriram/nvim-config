return {
		"williamboman/mason.nvim",
		dependencies = {
				"williamboman/mason-lspconfig.nvim",
				"neovim/nvim-lspconfig",
		},
		config = function()
				require("mason").setup()
				require("mason-lspconfig").setup({
						ensure_installed = { "pyright", "gopls", "rust_analyzer", "v_analyzer" }
				})
		end
}

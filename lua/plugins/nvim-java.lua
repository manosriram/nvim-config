return {
	'nvim-java/nvim-java',
	setup = function ()
		require('java').setup()
		require('lspconfig').jdtls.setup({})
	end
}

return {
		'echasnovski/mini.files',
		version = false,
		config = function()
				local files = require("mini.files")
				require("mini.files").setup()
		end
}

return {
    'theprimeagen/harpoon',
		branch = "harpoon2",
    config = function ()
				local harpoon = require("harpoon")
				local ui = require("harpoon.ui")

				-- Set initial keymaps
				vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
				vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

				vim.keymap.set("n", "<leader>p", function() harpoon:list():prev() end)
				vim.keymap.set("n", "<leader>n", function() harpoon:list():next() end)
    end
}

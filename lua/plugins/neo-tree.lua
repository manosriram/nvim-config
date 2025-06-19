return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
	opts = {
		window = {
			mappings = {
				["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
				["l"] = "focus_preview",
				["<C-b>"] = { "scroll_preview", config = {direction = 10} },
				["<C-f>"] = { "scroll_preview", config = {direction = -10} },
				["<C-d>"] = "delete",
			}
		}
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)

		-- Set up keymap to toggle neo-tree with Ctrl-n
		vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { silent = true })
		vim.keymap.set("n", "<leader>e", ":Neotree float<CR>", { silent = true })
	end,
}

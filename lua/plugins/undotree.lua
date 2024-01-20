local undotree_loaded, undotree = pcall(require, "harpoon")
if undotree_loaded then
		vim.g.undotree_SetFocusWhenToggle = 1
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
end

return {
		'mbbill/undotree'
}

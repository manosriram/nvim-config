local harpoon_loaded, harpoon = pcall(require, "harpoon")
if harpoon_loaded then
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    -- Set initial keymaps
    vim.keymap.set("n", "<leader>a", mark.add_file)
    vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)
    vim.keymap.set("n", "<leader>n", function() ui.nav_next() end)
    vim.keymap.set("n", "<leader>p", function() ui.nav_prev() end)

    -- Set additional keymaps
    vim.keymap.set("n", "<leader>x", function() ui.custom_function() end)
end

return {
    'theprimeagen/harpoon',
}

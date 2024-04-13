require("Navigator").setup()
require("Navigator").left()
require("Navigator").right()
require("Navigator").up()
require("Navigator").down()
require("Navigator").previous()

nmap(",v", ":vsplit<CR>")
nmap(",h", ":split<CR>")
nmap("<C-e>", ":set nomore <Bar> :ls <Bar> :set more <CR>:b<Space>")
nmap("<Enter>", "o<ESC>")
nmap("z", "dd")
nmap("<C-b>", ":NvimTreeFocus<CR>")
nmap("<C-n>", ":NvimTreeToggle<CR>")
nmap("<C-f>", ":NvimTreeFindFileToggle<CR>")
nmap("<Leader>l", ":tabnext<CR>")
nmap("<Leader>h", ":tabprev<CR>")
nmap("<Leader>t", ":tabnew<CR>")
nmap("<Leader>x", ":tabclose<CR>")
nrmap("f", "<Plug>(leap-forward)")
nrmap("F", "<Plug>(leap-backward)")
nmap("mm", ":b#<CR>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Navigator
map("n", "<C-h>", "<CMD>NavigatorLeft<CR>") map("n", "<C-l>", "<CMD>NavigatorRight<CR>")
map("n", "<C-k>", "<CMD>NavigatorUp<CR>")
map("n", "<C-j>", "<CMD>NavigatorDown<CR>")
map("n", "<C-p>", "<CMD>NavigatorPrevious<CR>")

-- vim-fugitive
nrmap("<Leader>gg", ":G<CR>")
nrmap("<Leader>d", ":G diff<CR>")
nrmap("<Leader>gl", ":G log<CR>")
nrmap("<Leader>gb", ":G branch<CR>")
nrmap("<Leader>gc", ":G commit<CR>")
nrmap("<Leader>gS", ":G status<CR>")
nrmap("<Leader>gaa", ":G add .<CR>")
nrmap("<Leader>gcc", ":G checkout ")
nrmap("<Leader>gst", ":G stash<CR>") -- stash only tracked files
nrmap("<Leader>gsu", ":G stash -u<CR>") -- stash untracked files
nrmap("<Leader>gsa", ":G stash apply<CR>")
nrmap("<Leader>gsp", ":G stash pop<CR>")
nrmap("<Leader>gsl", ":G stash list<CR>")

-- move through quickfix window lsp references
nrmap("]q", ":cnext<CR>")
nrmap("[q", ":cprev<CR>")
nrmap("]Q", ":.cc<CR>")
nrmap("<C-w>o", ":copen<CR>")
nrmap("<C-w>c", ":cclose<CR>")
vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.references() end, opts)

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", ";f", builtin.find_files, {})
vim.keymap.set("n", ";g", builtin.git_files, {})
vim.keymap.set("n", ";b", builtin.buffers, {})
vim.keymap.set("n", "<leader>K", function ()
		builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set("n", "<leader>S", "<cmd>lua require('spectre').toggle()<CR>", {
    desc = "Toggle Spectre"
})
vim.keymap.set("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", {
    desc = "Search current word"
})
vim.keymap.set("v", "<leader>sw", "<esc><cmd>lua require('spectre').open_visual()<CR>", {
    desc = "Search current word"
})
vim.keymap.set("n", "<leader>sp", "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", {
    desc = "Search on current file"
})

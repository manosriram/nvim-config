require("Navigator").setup()
require("Navigator").left()
require("Navigator").right()
require("Navigator").up()
require("Navigator").down()
require("Navigator").previous()

function Map(mode, shortcut, command, noremap)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = noremap, silent = true })
end

function Nrmap(shortcut, command)
    Map('n', shortcut, command, false)
end

function Nmap(shortcut, command)
    Map('n', shortcut, command, true)
end

function Imap(shortcut, command)
    Map('i', shortcut, command, true)
end


Nmap(",v", ":vsplit<CR>")
Nmap(",h", ":split<CR>")
Nmap("<C-e>", ":set nomore <Bar> :ls <Bar> :set more <CR>:b<Space>")
Nmap("<Enter>", "o<ESC>")
Nmap("z", "dd")
-- Nmap("<C-b>", ":NvimTreeFocus<CR>")
-- Nmap("<C-n>", ":NvimTreeToggle<CR>")
-- Nmap("<C-f>", ":NvimTreeFindFileToggle<CR>")
Nmap("<Leader>l", ":tabnext<CR>")
Nmap("<Leader>h", ":tabprev<CR>")
Nmap("<Leader>t", ":tabnew<CR>")
Nmap("<Leader>x", ":tabclose<CR>")
Nrmap("f", "<Plug>(leap-forward)")
Nrmap("F", "<Plug>(leap-backward)")
Nmap("mm", ":b#<CR>")
Nmap("<Leader>j", ":nohl<CR>")
Nmap("<Leader>q", ":make run<CR>", { noremap = true, silent = false })


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Navigator
Map("n", "<C-h>", "<CMD>NavigatorLeft<CR>") Map("n", "<C-l>", "<CMD>NavigatorRight<CR>")
Map("n", "<C-k>", "<CMD>NavigatorUp<CR>")
Map("n", "<C-j>", "<CMD>NavigatorDown<CR>")
Map("n", "<C-p>", "<CMD>NavigatorPrevious<CR>")

-- vim-fugitive
Nrmap("<Leader>gg", ":G<CR>")
Nrmap("<Leader>gd", ":G diff<CR>")
Nrmap("<Leader>gl", ":G log<CR>")
Nrmap("<Leader>gb", ":G blame<CR>")
Nrmap("<Leader>gB", ":G branch<CR>")
Nrmap("<Leader>gc", ":G commit<CR>")
Nrmap("<Leader>gs", ":G status<CR>")
Nrmap("<Leader>gaa", ":G add .<CR>")
Nrmap("<Leader>gcc", ":G checkout ")
Nrmap("<Leader>gSt", ":G stash<CR>") -- stash only tracked files
Nrmap("<Leader>gSu", ":G stash -u<CR>") -- stash untracked files
Nrmap("<Leader>gSa", ":G stash apply<CR>")
Nrmap("<Leader>gSp", ":G stash pop<CR>")
Nrmap("<Leader>gSl", ":G stash list<CR>")

-- move through quickfix window lsp references
Nrmap("]q", ":cnext<CR>")
Nrmap("[q", ":cprev<CR>")
Nrmap("<A-o>", ":copen<CR>")
Nrmap("<A-c>", ":cclose<CR>")
Nmap("<A-h>", ":Telescope help_tags<CR>")
vim.keymap.set("n", "<Leader>r", function() vim.lsp.buf.references() end)

vim.keymap.set("n", "<C-n>", function()
	local MiniFiles = require("mini.files")
	local _ = MiniFiles.close()
		or MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
	vim.defer_fn(function()
		MiniFiles.reveal_cwd()
	end, 30)
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

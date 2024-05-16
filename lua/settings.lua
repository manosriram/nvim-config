-- Highlight coloring
vim.cmd('hi Visual cterm=NONE ctermbg=0 ctermfg=NONE')
vim.cmd('hi Search cterm=NONE ctermbg=0 ctermfg=white')
vim.cmd('hi Pmenu cterm=NONE ctermbg=white ctermfg=0')
vim.cmd('hi MatchParen cterm=NONE ctermbg=NONE ctermfg=green')
vim.cmd([[
	set nocompatible              " be iMproved, required

	filetype off                  " required
	syntax on
	set number
	set laststatus=2
	set noswapfile
	set autoread
	set noshowmode
	set belloff=all
	set noerrorbells
	set visualbell
	set t_vb=
	filetype plugin on
	set encoding=UTF-8

	set bg=dark
	set background=dark
  let g:gruvbox_contrast_dark='hard'
  let g:gruvbox_contrast_light='hard'
	let g:gruvbox_contrast_dark = 'hard'

	let base16colorspace=256

	hi Visual term=reverse cterm=reverse guibg=White
	set backspace=indent,eol,start
	set tabstop=2 softtabstop=4 shiftwidth=4
	set noexpandtab
	set splitbelow
	set splitright
	set relativenumber
	set incsearch
	set noerrorbells
	set nowrap
	set maxmempattern=20000
	set ttimeout
	set ttimeoutlen=100
	set timeoutlen=3000
	set t_Co=256
	set termguicolors     " enable true colors support
]])

vim.g.go_doc_keywordprg_enabled = 0
vim.g.go_auto_type_info = 1
vim.g.to_imports_mode = 'gopls'
vim.g.go_gopls_enabled = 1
vim.g.go_info_mode = 'guru'
vim.g.go_auto_type_info = 'gopls'
vim.g.NERDSpaceDelims = 1
vim.g.NERDTreeDirArrows = 0
vim.g.user_emmet_leader_key=','
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim.cmd("colorscheme jellybeans")
vim.cmd("colorscheme kanagawa-dragon")
vim.cmd("highlight StatusLine cterm=NONE ctermbg=black ctermfg=white guibg=#000000 guifg=#ffffff")
vim.cmd([[autocmd BufNewFile,BufRead *.v set filetype=v]])
vim.cmd([[highlight link TelescopeSelection Search]])
vim.api.nvim_set_keymap('n', 'f', '<Plug>(leap-forward)', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 'F', '<Plug>(leap-backward)', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 'n', 'n:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'N:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })

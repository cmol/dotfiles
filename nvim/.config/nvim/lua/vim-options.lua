vim.g.mapleader = ","
vim.cmd("set undodir=~/.config/nvim/undodir") -- set undotree file directory
vim.cmd("set undofile") -- set undotree to save to file
vim.cmd("set number") -- set line number
vim.cmd("set nowrap") -- set no soft wrap
vim.cmd("set tabstop=2 softtabstop=2") -- set tab size
vim.cmd("set shiftwidth=2") -- affect amount of indentation
vim.cmd("set expandtab") -- set that tab will insert softabstop amount of space characters
vim.cmd("set nowritebackup") -- set to never save backup
vim.cmd("set noswapfile") -- set no swap file
vim.cmd("set nobackup") -- set no backup file
vim.cmd("set breakindent") -- set every wrapped line will continue visually indented
vim.cmd("set smartindent") -- set smart indentation
vim.cmd("set ignorecase") -- set to be cas sensitive when there is capital letter, this need set incsearch to work
vim.cmd("set smartcase") -- set to be cas sensitive when there is capital letter, this need set incsearch to work
vim.cmd("set incsearch") -- set search to be case insensitive
vim.cmd("set hidden")
vim.cmd("set clipboard+=unnamedplus")
vim.keymap.set("n", "<leader>v", "<C-w>v", {})
vim.keymap.set("n", "<leader>s", "<C-w>s", {})
vim.cmd(":highlight ExtraWhitespace guibg=#073642")
vim.cmd(":match ExtraWhitespace /\t/")
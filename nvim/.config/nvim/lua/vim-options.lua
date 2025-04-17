-- Set leader key
vim.g.mapleader = ","

-- Settings
vim.o.undodir = vim.fn.expand("~/.config/nvim/undodir") -- Set undotree file directory
vim.o.undofile = true                                   -- Enable persistent undo
vim.o.number = true                                     -- Enable line numbers
vim.o.wrap = false                                      -- Disable line wrapping
vim.o.tabstop = 2                                       -- Set tab size
vim.o.softtabstop = 2                                   -- Set soft tab size
vim.o.shiftwidth = 2                                    -- Indentation width
vim.o.expandtab = true                                  -- Convert tabs to spaces
vim.o.writebackup = false                               -- Disable write backup
vim.o.swapfile = false                                  -- Disable swap files
vim.o.backup = false                                    -- Disable backup files
vim.o.breakindent = true                                -- Maintain visual indentation on wrapped lines
vim.o.smartindent = true                                -- Enable smart indentation
vim.o.ignorecase = true                                 -- Ignore case in searches...
vim.o.smartcase = true                                  -- ...unless there is a capital letter
vim.o.incsearch = true                                  -- Enable incremental search
vim.o.hidden = true                                     -- Allow buffer switching without saving
vim.o.clipboard = "unnamedplus"                         -- Use system clipboard
vim.o.termguicolors = true                              -- Enable 24-bit colors

-- Show trailing spaces, tabs, and non-breaking spaces
vim.o.list = true
vim.cmd("set listchars=trail:·,tab:\\ \\ ,nbsp:␣")

-- Keymaps
local keymap = vim.keymap.set
keymap("n", "<leader>v", "<C-w>v", {})
keymap("n", "<leader>s", "<C-w>s", {})
keymap("n", "<leader>ga", ":Git add %<CR>", {})
keymap("n", "<leader>gb", ":Git blame<CR>", {})
keymap("n", "<leader>gc", ":Git commit<CR>", {})
keymap("n", "<leader>gd", ":Git diff<CR>", {})
keymap("n", "<leader>gnu", ":Git push<CR>", {})
keymap("n", "<leader>gnd", ":Git pull<CR>", {})
keymap("n", "<leader>gnf", ":Git fetch<CR>", {})
keymap("t", "<Esc>", "<C-\\><C-n>", {})
keymap("t", "<leader><Esc>", "<Esc>", {})

-- Highlight extra whitespace
vim.api.nvim_set_hl(0, "ExtraWhitespace", { bg = "#073642" })

local function set_match()
  vim.cmd("match ExtraWhitespace /\\t/")
end

-- Apply match when entering a window
vim.api.nvim_create_autocmd("WinEnter", {
  pattern = "*",
  callback = set_match,
})

-- Apply match to the current window immediately
set_match()

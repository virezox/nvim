local opts = { noremap = true, silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<space>", "<nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader= " "

-- Normal --
-- Better window navigation
keymap("n", "<c-h>", "<c-w>h", opts)
keymap("n", "<c-j>", "<c-w>j", opts)
keymap("n", "<c-k>", "<c-w>k", opts)
keymap("n", "<c-l>", "<c-w>l", opts)

-- Resize with arrows
keymap("n", "<a-up>", "<cmd>resize -2<cr>", opts)
keymap("n", "<a-down>", "<cmd>resize +2<cr>", opts)
keymap("n", "<a-left>", "<cmd>vertical resize -2<cr>", opts)
keymap("n", "<a-right>", "<cmd>vertical resize +2<cr>", opts)

-- Navigate buffers
keymap("n", "<s-l>", "<cmd>bnext<cr>", opts)
keymap("n", "<s-h>", "<cmd>bprevious<cr>", opts)

-- NvimTree
keymap("n", "<leader>t", "<cmd>NvimTreeToggle<cr>", opts)
keymap("n", "<leader>gt", "<cmd>NvimTreeFocus<cr>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)


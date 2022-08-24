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
keymap("n", "<c-up>", ":resize -2<cr>", opts)
keymap("n", "<c-down>", ":resize +2<cr>", opts)
keymap("n", "<c-left>", ":vertical resize -2<cr>", opts)
keymap("n", "<c-right>", ":vertical resize +2<cr>", opts)

-- Navigate buffers
keymap("n", "<s-l>", ":bnext<cr>", opts)
keymap("n", "<s-h>", ":bprevious<cr>", opts)

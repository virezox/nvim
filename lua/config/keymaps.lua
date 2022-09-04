local opts = { noremap = true, silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<space>", "<nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)

-- DAP
keymap("n", "<f1>", "<cmd>lua require('dap').continue()<cr>", opts)
keymap("n", "<f2>", "<cmd>lua require('dap').step_over()<cr>", opts)
keymap("n", "<f3>", "<cmd>lua require('dap').step_into()<cr>", opts)
keymap("n", "<f4>", "<cmd>lua require('dap').step_out()<cr>", opts)
keymap("n", "<leader>b", "<cmd>lua require('dap').toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>B", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts)
keymap(
  "n",
  "<leader>lp",
  "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
  opts
)
keymap("n", "<leader>dr", "<cmd>lua require('dap').repl.open()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require('dap').run_last()<cr>", opts)

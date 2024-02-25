local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- tmux
keymap("n", "<C-h>", ":TmuxNavigateLeft<CR>", opts)
keymap("n", "<C-j>", ":TmuxNavigateDown<CR>", opts)
keymap("n", "<C-k>", ":TmuxNavigateUp<CR>", opts)
keymap("n", "<C-l>", ":TmuxNavigateRight<CR>", opts)

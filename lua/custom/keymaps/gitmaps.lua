local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Git
keymap("n", "<leader>gg", ":Git<CR>", opts)
keymap("n", "<leader>gic", ":Git checkout<Space>", {})
keymap("n", "<leader>gp", ":Git push<CR>", {noremap = true})
keymap("n", "<leader>gl", ":Git pull<CR>", {noremap = true})

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "
--
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- open new tab
keymap('n', '<leader>tn', ':tabnew<CR>', opts)
-- copy relative path to current file to clipboard
keymap('n', '<leader>p', ":let @+=expand('%:p:.')<CR>", opts)
-- copy relative path with line number to current file to clipboard
keymap('n', '<leader>lp', ":let @+=expand('%').':'.line('.')<CR>", opts)
-- copy path to current file to clipboard
keymap('n', '<leader>P', ":let @+=expand('%:p')<CR>", opts)
-- CopilotChat
keymap('n', '<leader>co', ':CopilotChatOpen<CR>', opts)
keymap('v', '<leader>co', ':CopilotChatOptimize<CR>', opts)
keymap('n', '<leader>ccq', function()
  local input = vim.fn.input 'Quick Chat: '
  if input ~= '' then
    require('CopilotChat').ask(input, { selection = require('CopilotChat.select').buffer })
  end
end, { desc = 'CopilotChat - Quick chat' })
keymap('n', '<leader>ccs', function()
  local actions = require 'CopilotChat.actions'
  require('CopilotChat.integrations.telescope').pick(actions.help_actions())
end, { desc = 'CopilotChat - Help actions' })
keymap('n', '<leader>ccp', function()
  local actions = require 'CopilotChat.actions'
  require('CopilotChat.integrations.telescope').pick(actions.prompt_actions())
end, { desc = 'CopilotChat - Prompt actions' })
keymap('n', '<leader>oo', ':only<CR>', opts)
keymap('n', '<S-q>', ':q<CR>', opts)
keymap('n', '<S-w>', ':w<CR>', opts)
keymap('n', '<leader>ww', ':noa w<CR>', opts)

-- Resize with arrows
keymap('n', '<C-Up>', ':resize -5<CR>', opts)
keymap('n', '<C-Down>', ':resize +5<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -5<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +5<CR>', opts)

-- Navigate buffers
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)

-- Move text up and down
keymap('n', '<A-k>', ':m .-2<CR>==', opts)
keymap('n', '<A-j>', ':m .+1<CR>==', opts)

-- Insert --
-- Press jk fast to exit insert mode
-- keymap('i', 'jk', '<ESC>', opts)
-- keymap('i', 'kj', '<ESC>', opts)

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv^', opts)
keymap('v', '>', '>gv^', opts)

-- Move text up and down
keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)
keymap('v', 'p', '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap('x', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('x', 'K', ":m '<-2<CR>gv=gv", opts)
keymap('x', '<A-j>', ":m '>+1<CR>gv=gv", opts)
keymap('x', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

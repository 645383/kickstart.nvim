vim.g.copilot_assume_mapped = true
vim.opt.foldenable = false
-- vim.diagnostic.handlers.underline = 'hide'
vim.diagnostic.config({
  underline = false,
  virtual_text = false,
  signs = true,
  update_in_insert = false,
})
vim.o.modeline = false
-- vim.o.guicursor = 'n:blinkon100'
require 'custom.keymaps'
require 'custom.keymaps.gitmaps'

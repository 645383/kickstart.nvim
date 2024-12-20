return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    config = function()
      -- Registers copilot-chat source and enables it for copilot-chat filetype
      require('CopilotChat.integrations.cmp').setup()

      -- Disable default <tab> complete mapping for copilot chat
      require('CopilotChat').setup {
        mappings = {
          reset = {
            normal = '<C-c>',
            insert = '<C-c>',
          },
          complete = {
            insert = '',
          },
        },
        auto_follow_cursor = false,
        prompts = {
          MyCustomPrompt = {
            prompt = 'Evaluate code using a Fowler-Evans domain service ruler.',
            mapping = '<leader>ccmc',
            description = 'My custom prompt description',
            selection = require('CopilotChat.select').visual,
          },
        },
        -- rest of your config
      }

      -- Define custom command and keymap for MyCustomPrompt
      vim.api.nvim_set_keymap('n', '<leader>ccmc', ':CopilotChatMyCustomPrompt<CR>', { noremap = true, silent = true })
      vim.cmd 'command! CopilotChatMyCustomPrompt lua require("CopilotChat").prompt("MyCustomPrompt")'
    end,
    -- See Commands section for default commands if you want to lazy load on them
  },
}

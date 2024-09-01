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
      prompts = {
        MyCustomPrompt = {
          prompt = '/COPILOT_EXPLAIN Explain how it works.',
        },
      },
    },
    config = function()
      -- Registers copilot-chat source and enables it for copilot-chat filetype
      require('CopilotChat.integrations.cmp').setup()

      -- Disable default <tab> complete mapping for copilot chat
      require('CopilotChat').setup {
        mappings = {
          complete = {
            insert = '',
          },
        },
        -- rest of your config
      }
    end,
    -- See Commands section for default commands if you want to lazy load on them
  },
}

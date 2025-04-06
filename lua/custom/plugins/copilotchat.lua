return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main', -- Updated branch
    dependencies = {
      { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      debug = true, -- Enable debugging
      chat_autocomplete = true, -- Updated configuration
    },
    config = function()
      -- Registers copilot-chat source and enables it for copilot-chat filetype
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
        model = 'claude-3.7-sonnet',
        -- rest of your config
      }
    end,
    -- See Commands section for default commands if you want to lazy load on them
  },
}
-- sudo luarocks install --lua-version 5.1 tiktoken_core
-- sudo apt-get install lynx

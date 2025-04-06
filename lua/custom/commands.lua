-- Define a Lua function to checkout to the main branch and pull updates
local function git_checkout_and_pull()
  -- Run the Git commands
  vim.cmd '!git checkout main'
  vim.cmd '!git pull'
end

-- Create a custom Neovim command that calls the Lua function
vim.api.nvim_create_user_command('GitUpdateMain', git_checkout_and_pull, {})

-- Define a Lua function to fetch the latest tag, increment the tag number, and push the new tag to the remote
local function git_tag_and_push()
  -- Fetch the latest tags from the remote
  vim.cmd '!git fetch --tags'

  -- Get the latest tag
  local latest_tag = vim.fn.system 'git describe --tags `git rev-list --tags --max-count=1`'
  latest_tag = vim.fn.trim(latest_tag)

  -- Increment the tag number
  local major, minor, patch = latest_tag:match '(%d+)%.(%d+)%.(%d+)'
  if major and minor and patch then
    major = tonumber(major)
    minor = tonumber(minor)
    patch = tonumber(patch) + 1
    local new_tag = string.format('%d.%d.%d', major, minor, patch)

    -- Create the new tag
    vim.cmd('!git tag ' .. new_tag)

    -- Push the new tag to the remote
    vim.cmd('!git push origin ' .. new_tag)
  else
    print 'Failed to parse the latest tag.'
  end
end

-- Create a custom Neovim command that calls the Lua function
vim.api.nvim_create_user_command('GitTagAndPush', git_tag_and_push, {})

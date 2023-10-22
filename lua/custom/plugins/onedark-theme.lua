return {
  require('onedark').setup  {
    toggle_style_key = '<leader>ts', -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = {'dark', 'light'}, -- List of styles to toggle between
  }
}

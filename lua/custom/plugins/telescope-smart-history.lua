return {
	'nvim-telescope/telescope-smart-history.nvim',
	config = function()
		require('telescope').load_extension('smart_history')
	end
}

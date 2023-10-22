return {
	"klen/nvim-test",

	config = function()
		require('nvim-test').setup()
		require('nvim-test.runners.rspec'):setup {
			command = {'bundle', 'exec', 'rspec' }
		}
	end
}


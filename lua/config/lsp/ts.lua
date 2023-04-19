local api = vim.api
local autocmd = api.nvim_create_autocmd

require("typescript").setup({
	server = {
		on_attach = function()
			require("keymaps").lsp()
		end
	},
});

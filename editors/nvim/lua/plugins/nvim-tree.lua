return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
			local map = vim.keymap
			map.set("n", "<leader>nt", ":NvimTreeOpen<CR>")
		end,
	},
}

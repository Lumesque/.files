return {
	{
		"https://gitlab.com/bartekjaszczak/luma-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("luma").setup({
				theme = "light",
				contrast = "high",
			})
			vim.cmd([[colorscheme luma]])
		end,
	},
	--	{
	--		"rebelot/kanagawa.nvim",
	--		lazy = false,
	--		priority = 1000,
	--		config = function()
	--			vim.cmd([[colorscheme kanagawa]])
	--		end,
	--	},
}

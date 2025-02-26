return {
	-- The one below seems to be unsupported at the current moment, using a
	-- more up to date one
	{
		"voldikss/vim-floaterm",
		config = function()
			local map = vim.keymap
			map.set("n", "<leader>tt", ":FloatermShow<CR>")
			map.set("n", "<leader>tn", ":FloatermNew<CR>")
			map.set("n", "<leader>th", ":FloatermHide<CR>")
			map.set("t", "<C-w><esc>", "<C-\\><C-n>:FloatermHide<CR>")
			map.set("t", "<C-w><q>", [[<C-\><C-n>:FloatermKill<CR>]])
			map.set("t", "<C-w>n", "<C-\\><C-n>:FloatermNext<CR>")
			map.set("t", "<C-w>p", "<C-\\><C-n>:FloatermPrev<CR>")
			map.set("t", "<C-w><leader>tn", "<C-\\><C-n>:FloatermNew<CR>")
			map.set("t", "<C-w><leader>tq", "<C-\\><C-n>:FloatermKill<CR>")
			vim.cmd([[FloatermNew --silent]])
		end,
	},
	--{
	--"akinsho/toggleterm.nvim",
	--version = "*",
	--config = function()
	--local map = vim.keymap
	--map.set("n", "<leader>t", ":ToggleTerm<CR>")
	--end,
	--config = true,
	--},
}

local map = vim.keymap

-- these keybinds help to create other tabs and move around easier
map.set("n", "<leader>t", ":tabnew<CR>")
map.set("n", "<leader>h", ":tabprevious<CR>")
map.set("n", "<leader>;", ":tabprevious<CR>")
map.set("n", "<leader>x", ":tabclose<CR>")

-- these allow for easier navigation between panes
map.set("n", "<C-h>", "<C-w>h")
map.set("n", "<C-l>", "<C-w>l")
map.set("n", "<C-j>", "<C-w>j")
map.set("n", "<C-k>", "<C-w>k")


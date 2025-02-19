local opt = vim.opt
local cmd = vim.api.nvim_command
local g = vim.g

-- [[ quality of life options ]]
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4 
opt.signcolumn = "yes"
opt.undofile = true

-- [[ encoding options ]]
opt.encoding = "utf8"
opt.fileencoding = 'utf8'

-- [[ syntax options ]]
opt.syntax = "ON"
opt.termguicolors = true

-- [[ search options ]]
opt.ignorecase = false
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
opt.inccommand = 'split'

-- [[ whitespace options ]]
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4

-- [[ I don't know what these really do tbh
opt.splitright = true
opt.splitbelow = true
opt.breakindent = true

-- [[ keyboard and mouse configurations ]]
opt.mouse = 'a'
-- this determines how many lines to keep below and above
opt.scrolloff = 10


-- [[ sync the cliboard between os and neovim ]]
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

-- [[ design choices ]]
opt.cursorline = true

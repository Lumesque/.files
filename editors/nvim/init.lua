-- [[ init.lua ]]
--
--
local map = vim.keymap

map.set("n", "<Space>", "<Nop>", { silent = true, remap = false })

-- [[ leader configuration ]]
-- Note, this MUST be <Space>, otherwise it will not work for other <leader> keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ variable imports, used for separating out other options ]]
require("options/opts")
require("options/keys")


-- [[ PLUGINS ]]
require("config.lazy")

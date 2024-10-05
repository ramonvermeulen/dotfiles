vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- setup packagemanager
require("config.lazy")

-- set-up personal preferences
require("config.colorschema")
require("config.telescope")

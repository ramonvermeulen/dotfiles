return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = "all",
            highlight = { enabled = true },
            indent = { enabled = true },
        })
    end
}

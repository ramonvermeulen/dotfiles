-- Define the list of LSP servers to avoid repetition
local servers = { "lua_ls", "pyright" }

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = servers -- Reuse the list of servers here
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Use a loop to set up LSP servers, avoiding duplication
            for _, server in ipairs(servers) do
                lspconfig[server].setup({
                    capabilities = capabilities
                })
            end

            -- Keymap for code actions
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}


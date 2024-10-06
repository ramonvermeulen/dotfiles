local lsp_servers = { "lua_ls", "pyright" }
local formatters = { "stylua" }
local linters = {}

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
                ensure_installed = lsp_servers
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            for _, server in ipairs(lsp_servers) do
                lspconfig[server].setup({
                    capabilities = capabilities
                })
            end

            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>r", function()
                local cmdId
                cmdId = vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
                    callback = function()
                        local key = vim.api.nvim_replace_termcodes("<C-f>", true, false, true)
                        vim.api.nvim_feedkeys(key, "c", false)
                        vim.api.nvim_feedkeys("0", "n", false)
                        cmdId = nil
                        return true
                    end,
                })
                vim.lsp.buf.rename()
                vim.defer_fn(function()
                    if cmdId then
                        vim.api.nvim_del_autocmd(cmdId)
                    end
                end, 500)
            end, {})
        end
    },
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            local sources = {}

            for _, formatter in ipairs(formatters) do
                if null_ls.builtins.formatting[formatter] then
                    table.insert(sources, null_ls.builtins.formatting[formatter])
                end
            end

            for _, linter in ipairs(linters) do
                if null_ls.builtins.diagnostics[linter] then
                    table.insert(sources, null_ls.builtins.diagnostics[linter])
                end
            end

            null_ls.setup({
                sources = sources,
                ensure_installed = vim.list_extend(formatters, linters),
            })

            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        end
    }
}

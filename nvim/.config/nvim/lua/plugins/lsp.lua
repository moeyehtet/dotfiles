return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "mason-org/mason.nvim",
                opts = {},
            },
            "mason-org/mason-lspconfig.nvim"
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "pyright",
                    "rust_analyzer"
                },
                automatic_enable = false
            })

            vim.lsp.enable({
                "lua_ls",
                "clangd",
                "pyright",
                "rust_analyzer"
            })
        end,
    },
}

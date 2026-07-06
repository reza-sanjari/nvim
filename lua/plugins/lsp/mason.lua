return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        local mason_tool_installer = require("mason-tool-installer")

        -- enable mason and configure icons
        mason.setup({
            PATH = "append",
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",       -- lua
                "pyright",      -- python
                "pylsp",        -- python (jedi + ruff + mypy)
                "gopls",        -- go
                "ts_ls",        -- javascript / typescript
                "html",         -- html
                "cssls",        -- css
                "jdtls",        -- java
                "omnisharp",    -- c#
            },
            automatic_enable = false,
        })

        mason_tool_installer.setup({
            ensure_installed = {
                -- lua
                "stylua",
                -- python
                "ruff",
                "mypy",
                "debugpy",
                -- go
                "gopls",
                "gofumpt",
                "goimports",
                "golangci-lint",
                -- javascript / html
                "prettier",
                "eslint_d",
                -- c#
                "csharpier",
            },
        })
    end,
}

-- Conform (replaces formatter.nvim)
return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },

        -- single source of truth for <leader>f
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true, lsp_format = "fallback" })
                end,
                mode = { "n", "v" },
                desc = "Format buffer",
            },
        },

        opts = {
            notify_on_error = false,

            -- Format on save for C/C++ only (matches what you had)

            formatters_by_ft = {
                -- C / C++ (uses .clang-format automatically)
                c = { "clang_format" },
                cpp = { "clang_format" },

                -- Lua
                lua = { "stylua" },

                -- JS/TS/JSON/CSS/MD
                javascript = { "prettier" },
                typescript = { "prettier" },
                json = { "prettier" },
                css = { "prettier" },
                markdown = { "prettier" },
            },
        },
    },
}

return {
    -- order of these is important
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- for completion capabilities
        'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
        -- completion capabilities
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- lsp configs
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",
                "gopls",
                "lua_ls",
                "pylsp",
            },
            handlers = {
                -- default handler (optional)
                -- default settings for rest of the lsp
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                -- customization for lua lsp
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = {
                                    -- Tell the language server which version of Lua you're using
                                    -- (most likely LuaJIT in the case of Neovim)
                                    version = 'LuaJIT',
                                },
                                diagnostics = {
                                    -- Get the language server to recognize the `vim` global
                                    globals = {
                                        "vim",
                                        "require",
                                        "MohitJangraGroup",
                                    },
                                },
                                workspace = {
                                    -- Make the server aware of Neovim runtime files
                                    library = vim.api.nvim_get_runtime_file("", true),
                                },
                                -- Do not send telemetry data containing a randomized but unique identifier
                                telemetry = {
                                    enable = false,
                                },
                            },
                        },
                    })
                end,
            },
        })

        -- Key binding for lsp attached buffers
        vim.api.nvim_create_autocmd('LspAttach', {
            group = MohitJangraGroup,
            callback = function(ev)
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
                    { desc = '[G]oto [D]efination', buffer = ev.buf, remap = false })
                vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end,
                    { desc = '[G]oto [D]eclaration', buffer = ev.buf, remap = false })
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
                    { desc = 'Hover Documentaion', buffer = ev.buf, remap = false })
                vim.keymap.set("n", "<leader>F", require("telescope.builtin").spell_suggest,
                    { desc = 'Spelling Suggestions', buffer = ev.buf, remap = false })
                vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol,
                    { desc = '[W]orkspace [S]ymbols', buffer = ev.buf, remap = false })
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
                    { desc = 'Open [D]iagnostics', buffer = ev.buf, remap = false })
                vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references,
                    { desc = '[G]oto [R]eference LSP', buffer = ev.buf, remap = false })
                vim.keymap.set("n", "gI", require('telescope.builtin').lsp_implementations,
                    { desc = '[G]oto [I]mplementaion LSP', buffer = ev.buf, remap = false })
                vim.keymap.set("n", "<leader>D", function() vim.lsp.buf.type_definition() end,
                    { desc = 'Type [D]efinition', buffer = ev.buf, remap = false })
                vim.keymap.set("n", "<leader>m", require('telescope.builtin').lsp_document_symbols,
                    { desc = '[D]ocument [S]ymbols LSP', buffer = ev.buf, remap = false })
                vim.keymap.set("n", "<leader>ws", require('telescope.builtin').lsp_workspace_symbols,
                    { desc = '[W]orkspace [S]ymbols LSP', buffer = ev.buf, remap = false })

                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
                    { desc = '', buffer = ev.buf, remap = false })
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
                    { desc = '', buffer = ev.buf, remap = false })

                vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end,
                    { desc = '[C]ode [A]ction', buffer = ev.buf, remap = false })
                vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end,
                    { desc = '[G]oto [R]eference', buffer = ev.buf, remap = false })
                vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end,
                    { desc = '[R]e[N]ame', buffer = ev.buf, remap = false })
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
                    { desc = 'Signature Documentation', buffer = ev.buf, remap = false })
                vim.keymap.set("n", "<leader>wa", function() vim.lsp.buf.add_workspace_folder() end,
                    { desc = '[W]orkspace [A]dd Folder', buffer = ev.buf, remap = false })
                vim.keymap.set("n", "<leader>wr", function() vim.lsp.buf.remove_workspace_folder() end,
                    { desc = '[W]orkspace [R]emove Folder', buffer = ev.buf, remap = false })
                vim.keymap.set("n", "<leader>wl", function() vim.lsp.buf.list_workspace_folders() end,
                    { desc = '[W]orkspace [L]ist Folders', buffer = ev.buf, remap = false })
            end
        })

        -- enable diagnostic virtual text
        vim.diagnostic.config({
            update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
            -- virtual_text = true,
        })
    end
}

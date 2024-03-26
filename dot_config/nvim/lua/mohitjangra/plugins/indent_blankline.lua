return {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        -- configuration for whitespace characters [[ nextLine or enter, space, multispace ]]
        vim.opt.list = true

        -- vim.opt.listchars:append "eol:↴"

        vim.opt.listchars:append "space: "
        -- vim.opt.listchars:append "space:␣"

        -- vim.opt.listchars:append "tab:  "
        vim.opt.listchars:append "tab:»\\"
        -- vim.opt.listchars:append "tab:▸\\"


        -- vim.opt.listchars:append "lead:∙" -- lead space replacements

        vim.opt.listchars:append "trail: "
        -- vim.opt.listchars:append "trail:·"

        vim.opt.listchars:append "extends:→"
        -- vim.opt.listchars:append "extends:»"

        vim.opt.listchars:append "precedes:←"
        -- vim.opt.listchars:append "precedes:«"

        vim.opt.termguicolors = true

        require('ibl').setup {
            scope = {
                enabled = true,
                show_start = true,
                show_end = false,
                injected_languages = false,
                highlight = { "Function", "Label" },
                priority = 500,
            },
            indent = {
                char = "▎",
                smart_indent_cap = true,
                highlight = { "Function", "Label" },
            },

            -- indent = { char = "▏", smart_indent_cap = true },
            -- show_current_context = true,
            -- show_end_of_line = true;
            -- show_current_context_start = true,
            -- space_char_blankline = " "
        }
    end
}

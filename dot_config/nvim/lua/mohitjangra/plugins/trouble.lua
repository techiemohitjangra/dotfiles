return {
    "folke/trouble.nvim",
    config = function()
        local trouble = require('trouble')
        trouble.setup {
            icons = true,
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
        vim.keymap.set('n', '<leader>tt', function() trouble.toggle() end, { silent = true, noremap = true })
        vim.keymap.set("n", "<leader>tx", function() trouble.toggle() end, { silent = true, noremap = true })
        vim.keymap.set("n", "<leader>tw", function() trouble.toggle("workspace_diagnostics") end,
            { silent = true, noremap = true })
        vim.keymap.set("n", "<leader>td", function() trouble.toggle("document_diagnostics") end,
            { silent = true, noremap = true })
        vim.keymap.set("n", "<leader>tq", function() trouble.toggle("quickfix") end, { silent = true, noremap = true })
        vim.keymap.set("n", "<leader>tl", function() trouble.toggle("loclist") end, { silent = true, noremap = true })

        vim.keymap.set("n", "<leader>tu", function() trouble.next({ skip_groups = true, jump = true }) end,
            { silent = true, noremap = true })
        vim.keymap.set("n", "<leader>tu", function() trouble.previous({ skip_groups = true, jump = true }) end,
            { silent = true, noremap = true })

        vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end,
            { silent = true, noremap = true })
    end
}

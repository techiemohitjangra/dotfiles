return {
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
        config = function()
            require('rose-pine').setup({
                variant = 'main',
            })
            require('lualine').setup({
                options = {
                    theme = 'rose-pine'
                }
            })
            vim.cmd.colorscheme('rose-pine')
        end
    },
    {
        'Mofiqul/dracula.nvim',
        name = 'dracula',
        lazy = true,
    },
    {
        'oxfist/night-owl.nvim',
        name = 'nightowl',
        lazy = true,
    },
    {
        'folke/tokyonight.nvim',
        name = 'tokyonight',
        lazy = true,
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = true,
    },
    {
        'rebelot/kanagawa.nvim',
        name = 'kanagawa',
        lazy = true,
    },
    {
        'rmehri01/onenord.nvim',
        name = 'onenord',
        lazy = true,
    }
}

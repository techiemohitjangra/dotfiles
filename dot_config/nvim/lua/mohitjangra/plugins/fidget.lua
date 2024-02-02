-- LSP progress Indicator
return {
    'j-hui/fidget.nvim',
    name = 'fidget',
    config = function()
        require('fidget').setup()
    end,
}

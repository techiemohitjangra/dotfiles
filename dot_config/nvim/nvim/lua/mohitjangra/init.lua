require("mohitjangra.remaps")
require("mohitjangra.set")
require("mohitjangra.diagnostic")

local MohitJangraGroup = vim.api.nvim_create_augroup('mohitjangra', {})
local yank_group = vim.api.nvim_create_augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

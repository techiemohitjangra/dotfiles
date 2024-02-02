vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- uncomment to enable mouse mode
-- vim.o.mouse = 'a'

-- vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', { silent = true })
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- open netrw window
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move rows in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- navigate to end of file
vim.keymap.set("n", "G", "Gzz")

vim.keymap.set("v", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z")

-- page down i.e. go half page down
vim.keymap.set("n", "<C-n>", "<C-d>zz")
-- page up i.e. go half page up
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- navigate to next and previous match from /
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

-- paste from system clipboard
vim.keymap.set("n", "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- navigation in quickfix list
vim.keymap.set("n", "<C-K>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-J>", "<cmd>cprev<CR>zz")

-- navigation in location list
vim.keymap.set("n", "<leader>K", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>J", "<cmd>lprev<CR>zz")

-- navigation between windows
vim.keymap.set("n", "<M-h>", "<cmd>wincmd h<CR>zz")
vim.keymap.set("n", "<M-j>", "<cmd>wincmd j<CR>zz")
vim.keymap.set("n", "<M-k>", "<cmd>wincmd k<CR>zz")
vim.keymap.set("n", "<M-l>", "<cmd>wincmd l<CR>zz")

-- replace string
vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- grant executable permission to current file
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true })

-- jump to packer.lua file
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/mohitjangra/plugins/<CR>");

-- source current file (over ridden by []Find Existing Buffer from telescope)
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so %")
end)

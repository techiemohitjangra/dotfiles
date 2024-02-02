function Action(macro)
    local old_pos = vim.fn.winsaveview()
    vim.cmd(string.format(":normal! %s", macro))
    vim.fn.winrestview(old_pos)
end

function NewItem(macro)
    vim.cmd(string.format(":normal! %s", macro))
end

-- mark list item done
vim.keymap.set("n", "md", ":lua Action('^f[\\128\\253alrx')<CR>")

-- Mark list item not done (alternative representation)
vim.keymap.set("n", "mnd", ":lua Action('^f[\\128\\253alr ')<CR>")

-- Mark list item done and move item to end of file
vim.keymap.set("n", "mD", ":lua Action('^f[\\128\\253alrx\\128\\253addGp')<CR>")

-- Make current line a list item
vim.keymap.set("n", "mi", ":lua Action('^i- [ ] \\27')<CR>")

-- Add items in the next line
vim.keymap.set("n", "ma", ":lua NewItem('o- [ ] \\27')<CR>")

-- Add items in the previous line
vim.keymap.set("n", "mA", ":lua NewItem('O- [ ] \\27')<CR>")



-- markdown specific keymap
vim.cmd(":set wrap linebreak")

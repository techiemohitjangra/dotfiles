-- add \ at the end of line, used for macros in c and c++
vim.api.nvim_buf_set_keymap(0, "n", "<leader>cm", "A\\j0")

-- add keybind to build C/C++ project
vim.api.nvim_buf_set_keymap(0, "n", "<F5>", ":!build.sh<CR>", { noremap = true, silent = true })

-- comment docs
-- Example:
-- /* DESC:
--  * function:
--  * param:
--  * return:
--  */
vim.api.nvim_buf_set_keymap(0, "n", "<leader>cd", 'o/* Description: \nfunction: \nparam: \nreturn: \n<BS>/<ESC>4kA',
    { noremap = true, silent = true })

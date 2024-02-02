return {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup({
            -- add a space b/w comment and the line
            padding = true,
            -- whether the cursor should stay at its position
            sticky = true,
            -- lines to be ignored while (un)comment
            ignore = nil,
            -- lhs of toggle mappings in normal mode
            toggler = {
                -- line-comment toggle keymap
                line = 'gcc',
                -- block-comment toggle keymap
                block = 'gbc',
            },
            -- lhs of operator-pending mappings in normal and visual mode
            opleader = {
                -- line-comment keymap
                line = 'gc',
                -- block-comment keymap
                block = 'gb',
            },
            -- lhs of extra mappings
            extra = {
                -- add comment on the line above
                above = 'gco',
                -- add comment on the line below
                below = 'gco',
                -- add comment at the end of line
                eol = 'gca',
            },
            -- enable keybindings
            -- note: if given `false` then the plugin won't create any mappings
            mappings = {
                -- operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                basic = true,
                -- extra mapping; `gco`, `gco`, `gca`
                extra = true,
            },
            -- function to call before (un)comment
            pre_hook = nil,
            -- function to call after (un)comment
            post_hook = nil,
        })
    end
}

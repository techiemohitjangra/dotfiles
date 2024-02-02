return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'nvim-treesitter/playground',
        'nvim-treesitter/nvim-tree-docs',
        'nvim-treesitter/nvim-treesitter-context',
    },
    -- build = ':TSUpdate',
    config = function()
        -- require('nvim-treesitter.install').update({ with_sync = true })
        -- ts_update()
        require('nvim-treesitter.configs').setup {
            -- A list of parser names, or "all"
            ensure_installed = { 'vim', 'vimdoc', 'javascript', 'jsdoc', 'c', 'cpp', 'rust', 'go', 'gomod', 'gosum', 'gowork', 'bash', 'gitignore', 'lua', 'luadoc', 'mermaid', 'python', 'sql', 'templ', 'zig' },

            modules = {},
            ignore_install = {},


            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            -- Automatically generate docs
            tree_docs = { enable = true },

            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<c-space>',
                    node_incremental = '<c-space>',
                    scope_incremental = '<c-s>',
                    node_decremental = '<M-space>',
                }
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['aa'] = '@parameter.outer',
                        ['ia'] = '@parameter.inner',
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                    },
                },
            },
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    [']m'] = '@function.outer',
                    [']]'] = '@class.outer',
                },
                goto_next_end = {
                    [']M'] = '@function.outer',
                    [']['] = '@class.outer',
                },
                goto_previous_start = {
                    ['[m'] = '@function.outer',
                    ['[['] = '@class.outer',
                },
                goto_previous_end = {
                    ['[M'] = '@function.outer',
                    ['[]'] = '@class.outer',
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ['<leader>a'] = '@parameter.inner',
                },
                swap_previous = {
                    ['<leader>A'] = '@parameter.inner',
                },
            },

            highlight = {
                -- `false` will disable the whole extension
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
            refactor = {
                highlight_definitions = {
                    enable = true,
                    -- Set to false if you have an 'updatetime' of ~100.
                    clear_on_cursor_move = true,
                },
                highlight_current_scope = {
                    enable = true,
                },
                smart_rename = {
                    enable = true,
                    -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
                    keymaps = {
                        smart_rename = 'grr',
                    }
                },
                navigation = {
                    enable = true,
                    -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
                    keymaps = {
                        goto_definition = 'gnd',
                        list_defninitions = 'gnD',
                        list_definittions_toc = 'gO',
                        goto_next_usage = '<a-*>',
                        goto_previous_usage = '<a-#>',
                    },
                },
            }
        }
    end
}

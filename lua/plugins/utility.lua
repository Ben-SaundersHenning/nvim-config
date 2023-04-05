return {

    -- Comment (easy commenting)
    {

        'numToStr/Comment.nvim',

        -- Mostly copied from the default config,
        -- with a few adjustments
        config = function()

            require('Comment').setup({

                ---Add a space b/w comment and the line
                padding = true,
                ---Whether the cursor should stay at its position
                sticky = true,
                ---Lines to be ignored while (un)comment
                ignore = nil,

                ---LHS of toggle mappings in NORMAL mode
                toggler = {
                    ---Line-comment toggle keymap
                    line = '<leader>i',
                    ---Block-comment toggle keymap
                    block = '<leader>u',
                },

                ---LHS of operator-pending mappings in NORMAL and VISUAL mode
                opleader = {
                    ---Line-comment keymap
                    line = '<leader>i',
                    ---Block-comment keymap
                    block = '<leader>u',
                },

                ---Enable keybindings
                ---NOTE: If given `false` then the plugin won't create any mappings
                mappings = {
                    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                    basic = true,
                    ---Extra mapping; `gco`, `gcO`, `gcA`
                    extra = false,
                },

            })

        end

    },

    -- Auto Session Management
    -- Default session file is named 'Session.vim',
    -- exists within the local directory
    -- {
    --
    --     'echasnovski/mini.sessions',
    --
    --     version = false,
    --
    --     config = function ()
    --
    --         require('mini.sessions').setup({})
    --
    --     end
    --
    -- },

    -- Tpope Auto Session management - in Vimscipt
    {

        'tpope/vim-obsession'

    },

}

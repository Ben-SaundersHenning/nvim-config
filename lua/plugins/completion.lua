return {

    -- Mason, a package manager for language servers and more
    {

        'williamboman/mason.nvim',

        build = ":MasonUpdate",

        config = function ()

            require('mason').setup({})

        end

    },

    -- LSPConfig and Mason stuff 
    -- This is where you add language servers
    {

        'williamboman/mason-lspconfig.nvim',

        config = function ()

            require('mason-lspconfig').setup({ensure_installed = {

                'lua_ls',
                'clangd',
                'pyright',
                'rust_analyzer',
                'html',
                'cssls',
                'quick_lint_js',
                'tsserver',

            }})

        end

    },

    -- Treesitter
    {

        'nvim-treesitter/nvim-treesitter',

        config = function()

            vim.cmd('TSUpdate')

        end

    },

    -- Cmp, Autocompletion
    {

        'hrsh7th/nvim-cmp',

        config = function()

            local cmp = require('cmp')

            cmp.setup({

                mapping = cmp.mapping.preset.insert({

                    -- Mapping for enter key
                    ['<CR>'] = cmp.mapping.confirm({select = true}),

                }),

                snippet = {

                    expand = function(args)

                        require('luasnip').lsp_expand(args.body)

                    end,

                },

                sources = cmp.config.sources({

                    {name = 'nvim_lsp'},
                    {name = 'luasnip'},

                }, {

                    {name = 'buffer'},

                }),

            })

        end

    },

        -- Luasnip, a snippet engine (needed for cmp)
        {

            'L3MON4D3/LuaSnip'

        },

        -- Cmp, Autocompletion (additional snippets, I think)
        {

            'hrsh7th/cmp-nvim-lsp',

        },


    -- LSP config
    {

        'neovim/nvim-lspconfig',

        config = function()

            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            require('mason-lspconfig').setup_handlers({

                function(server_name)

                    lspconfig[server_name].setup({

                        on_attach = lsp_attach,
                        capabilities = capabilities,

                    })

                end

            })

            -- Setup language servers for CMP
            -- lspconfig.clangd.setup({capabilities = capabilities})
            -- lspconfig.lua_ls.setup({capabilities = capabilities})
            -- lspconfig.pyright.setup({capabilities = capabilities})
            -- lspconfig.rust_analyzer.setup({capabilities = capabilities})
            -- lspconfig.html.setup({capabilities = capabilities, init_options = {embeddedLanguages = {css = true, javascript = true}}})
            -- lspconfig.tsserver.setup({capabilities = capabilities})
            -- lspconfig.cssls.setup({capabilities = capabilities})
            -- lspconfig..setup({capabilities = capabilities})
            --
            -- Global mappings These are all defaults.

            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
              group = vim.api.nvim_create_augroup('UserLspConfig', {}),
              callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<space>f', function()
                  vim.lsp.buf.format { async = true }
                end, opts)
              end,
            })

        end

    },

}
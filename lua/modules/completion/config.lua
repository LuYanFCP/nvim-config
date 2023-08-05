local config = {}

-- config server in this function
function config.nvim_lsp()
    local lspconfig = require('lspconfig')

    local on_attach = function(client, bufnr)
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
        end

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    end

    -- setup python lspconfig
    lspconfig.pyright.setup({
        on_attach = on_attach,
        settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true
                }
            }
        }
    })
    -- setup go lspconfig
    lspconfig.gopls.setup({})
    -- setup lua lspconfig
    lspconfig.lua_ls.setup({
        settings = {
            Lua = {
                diagnostics = {enable = true, globals = {'vim'}},
                runtime = {
                    version = 'LuaJIT',
                    path = vim.split(package.path, ';')
                },
                workspace = {
                    library = {
                        vim.env.VIMRUNTIME,
                        vim.env.HOME .. '/.local/share/nvim/lazy/emmylua-nvim'
                    },
                    checkThirdParty = false
                },
                completion = {callSnippet = 'Replace'}
            }
        }
    })
    -- config clangd
    lspconfig.clangd.setup({})
    -- config rust
    lspconfig.rust_analyzer.setup({})
end

function config.nvim_cmp()
    local cmp = require('cmp')

    cmp.setup({
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
                -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            end
        },
        window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
            {name = 'nvim_lsp'}, {name = 'buffer'}, {name = 'path'},
            {name = 'luasnip'}, {name = 'nvim_lua'}, {name = 'cmp_tabnine'},
            {name = 'emoji'}
        }, {{name = 'buffer'}})
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
            {name = 'cmp_git'} -- You can specify the `cmp_git` source if you were installed it.
        }, {{name = 'buffer'}})
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({'/', '?'}, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {{name = 'buffer'}}
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
    })

    -- Use nvim_lsp source for all LSP servers.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    for _, lsp in ipairs(vim.lsp.get_active_clients()) do
        lsp['capabilities'] = capabilities
    end

    require('copilot_cmp').setup()
end

function config.lua_snip()
    local ls = require('luasnip')
    local types = require('luasnip.util.types')
    ls.config.set_config({
        history = true,
        enable_autosnippets = true,
        updateevents = 'TextChanged,TextChangedI',
        ext_opts = {
            [types.choiceNode] = {
                active = {virt_text = {{'<- choiceNode', 'Comment'}}}
            }
        }
    })
    require('luasnip.loaders.from_lua').lazy_load({
        paths = vim.fn.stdpath('config') .. '/snippets'
    })
    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip.loaders.from_vscode').lazy_load({paths = {'./snippets/'}})
end

function config.lspsaga() require('lspsaga').setup({}) end

function config.copilot_nvim()
    require('copilot').setup({
        cmp = {enabled = true, method = 'getCompletionsCycling'},
        panel = {enabled = false},
        suggestion = {enabled = true}
    })
end

return config

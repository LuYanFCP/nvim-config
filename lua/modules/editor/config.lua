local config = {}

function config.nvim_treesitter()
    vim.api.nvim_command('set foldmethod=expr')
    vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
    require('nvim-treesitter.configs').setup({
        ensure_installed = {
            'bash', 'c', 'cpp', 'css', 'dockerfile', 'go', 'gomod', 'html',
            'javascript', 'json', 'lua', 'python', 'regex', 'rust', 'toml',
            'tsx', 'typescript', 'yaml', 'markdown'
        },
        ignore_install = {'phpdoc'},
        highlight = {enable = true},
        textobjects = {
            select = {
                enable = true,
                keymaps = {
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['ac'] = '@class.outer',
                    ['ic'] = '@class.inner'
                }
            }
        }
    })
end

return config

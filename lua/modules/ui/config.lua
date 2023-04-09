local config = {}

function config.zephyr() vim.cmd('colorscheme zephyr') end

function config.dashboard()
    local db = require('dashboard')
    db.setup({
        theme = 'hyper',
        config = {
            week_header = {enable = true},
            shortcut = {
                {
                    desc = ' Update',
                    group = '@property',
                    action = 'Lazy update',
                    key = 'u'
                }, {
                    desc = ' Files',
                    group = 'Label',
                    action = 'Telescope find_files',
                    key = 'f'
                }, {
                    desc = ' Apps',
                    group = 'DiagnosticHint',
                    action = 'Telescope app',
                    key = 'a'
                }, {
                    desc = ' dotfiles',
                    group = 'Number',
                    action = 'Telescope dotfiles',
                    key = 'd'
                }
            }
        }
    })
end

function config.nvim_bufferline()
    require('bufferline').setup({
        options = {
            modified_icon = '✥',
            buffer_close_icon = '',
            always_show_bufferline = false
        }
    })
end

function config.indent_blankline()
    require('indent_blankline').setup({
        char = '│',
        use_treesitter_scope = true,
        show_first_indent_level = true,
        show_current_context = false,
        show_current_context_start = false,
        show_current_context_start_on_current_line = false,
        filetype_exclude = {'dashboard', 'log', 'TelescopePrompt'},
        buftype_exclude = {'terminal', 'nofile', 'prompt'}
    })
end

function config.lualine() require('lualine').setup() end

function config.nvim_tree()
    require("nvim-tree").setup({
        sort_by = "case_sensitive",
        renderer = {group_empty = true},
        filters = {dotfiles = true}
    })
end

function config.lsp_colors()
    require("lsp-colors").setup({
        Error = "#db4b4b",
        Warning = "#e0af68",
        Information = "#0db9d7",
        Hint = "#10B981"
    })
end

function config.toggleterm() require("toggleterm").setup() end

return config

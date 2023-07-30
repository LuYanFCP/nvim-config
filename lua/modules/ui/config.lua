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

function config.lualine()
    local colors = {
        blue = '#80a0ff',
        cyan = '#79dac8',
        black = '#080808',
        white = '#c6c6c6',
        red = '#ff5189',
        violet = '#d183e8',
        grey = '#303030'
    }

    local bubbles_theme = {
        normal = {
            a = {fg = colors.black, bg = colors.violet},
            b = {fg = colors.white, bg = colors.grey},
            c = {fg = colors.black, bg = colors.black}
        },

        insert = {a = {fg = colors.black, bg = colors.blue}},
        visual = {a = {fg = colors.black, bg = colors.cyan}},
        replace = {a = {fg = colors.black, bg = colors.red}},

        inactive = {
            a = {fg = colors.white, bg = colors.black},
            b = {fg = colors.white, bg = colors.black},
            c = {fg = colors.black, bg = colors.black}
        }
    }

    require('lualine').setup {
        options = {
            theme = bubbles_theme,
            component_separators = '|',
            section_separators = {left = '', right = ''}
        },
        sections = {
            lualine_a = {
                {'mode', separator = {left = ''}, right_padding = 2}
            },
            lualine_b = {'filename', 'diff', 'branch'},
            lualine_c = {'diagnostics', 'fileformat'},
            lualine_x = {},
            lualine_y = {'filetype', 'progress'},
            lualine_z = {
                {'location', separator = {right = ''}, left_padding = 2}
            }
        },
        inactive_sections = {
            lualine_a = {'filename'},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {'location'}
        },
        tabline = {},
        extensions = {}
    }

end

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

function config.toggleterm()
    require("toggleterm").setup {
        open_mapping = [[<c-\>]],
        winbar = {
            enabled = true,
            name_formatter = function(term) --  term: Terminal
                return term.name
            end
        }
    }
end

function config.trobule() require("trouble").setup() end

return config

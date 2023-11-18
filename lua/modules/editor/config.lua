local config = {}

function config.nvim_treesitter()
  vim.api.nvim_command('set foldmethod=expr')
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'bash',
      'c',
      'cpp',
      'css',
      'dockerfile',
      'go',
      'gomod',
      'html',
      'javascript',
      'json',
      'lua',
      'python',
      'regex',
      'rust',
      'toml',
      'tsx',
      'typescript',
      'yaml',
      'markdown',
    },
    ignore_install = { 'phpdoc' },
    highlight = { enable = true },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
    },
  })
end

function config.guard_config()
  local ft = require('guard.filetype')

  -- use clang-format and clang-tidy for c/cpp files
  ft('c'):fmt('clang-format'):lint('clang-tidy')

  ft('cpp'):fmt('clang-format'):lint('clang-tidy')

  -- use stylua to format lua files and no linter
  ft('lua'):fmt('stylua')

  ft('rust'):fmt('rustfmt')

  -- python
  ft('python'):fmt('black')
  -- golang
  ft('go'):fmt('gofmt')

  -- multiple files register
  ft('typescript,javascript,typescriptreact'):fmt('prettier')

  -- call setup LAST
  require('guard').setup({
    -- the only options for the setup function
    fmt_on_save = false,
    -- Use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = false,
  })
end

function config.persisted()
  require('persisted').setup()
end

function config.hlchunk()
  require('hlchunk').setup({
    indent = {
      chars = { "│", "¦", "┆", "┊", }, -- more code can be found in https://unicodeplus.com/
      style = {
          "#8B00FF",
      },
    },
    line_num = {
      style = "#806d9c",
    },
  })
end

return config

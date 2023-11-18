local config = {}

function config.git_sign()
  require('gitsigns').setup({
    current_line_blame = true,
  })
end

return config

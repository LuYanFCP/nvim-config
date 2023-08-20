local config = {}

function config.git_sign()
  require('gitsigns').setup()
end

function config.git_blame()
  require('gitblame').setup({
    --Note how the `gitblame_` prefix is omitted in `setup`
   enabled = false,
  })
  
end

return config

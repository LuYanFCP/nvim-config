local package = require('core.pack').package
local conf = require('modules.editor.config')

package({
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    run = ':TSUpdate',
    config = conf.nvim_treesitter,
    dependencies = {'nvim-treesitter/nvim-treesitter-textobjects'}
})

package({'nvimdev/guard.nvim', config = conf.guard_config})

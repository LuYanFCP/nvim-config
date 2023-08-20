local package = require('core.pack').package
local conf = require('modules.git.config')

package({ 'lewis6991/gitsigns.nvim', config = conf.git_sign })

package({ 'f-person/git-blame.nvim', config = conf.git_blame })

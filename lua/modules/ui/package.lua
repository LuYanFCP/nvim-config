local package = require('core.pack').package
local conf = require('modules.ui.config')

package({ 'glepnir/zephyr-nvim', config = conf.zephyr })

package({ 'glepnir/dashboard-nvim', config = conf.dashboard })

package({
  'akinsho/nvim-bufferline.lua',
  config = conf.nvim_bufferline,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
})

package({
  'lukas-reineke/indent-blankline.nvim',
  event = 'BufRead',
  config = conf.indent_blankline,
})

package({ 'nvim-lualine/lualine.nvim', config = conf.lualine })

package({ 'nvim-tree/nvim-tree.lua', config = conf.nvim_tree })

package({ 'folke/lsp-colors.nvim', config = conf.lsp_colors })

package({ 'akinsho/toggleterm.nvim', config = conf.toggleterm })

package({ 'folke/trouble.nvim', config = conf.trobule })

local package = require('core.pack').package
local conf = require('modules.tools.config')

package({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzy-native.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim' },
    { 'nvim-telescope/telescope-media-files.nvim' },
    { 'nvim-telescope/telescope-project.nvim' },
    { 'nvim-telescope/telescope-symbols.nvim' },
    { 'nvim-telescope/telescope-z.nvim' },
    { 'tsakirist/telescope-lazy.nvim' },
    { 'paopaol/telescope-git-diffs.nvim' },
    { 'ThePrimeagen/git-worktree.nvim' },
  },
})

package({
  'glepnir/hlsearch.nvim',
  event = 'BufRead',
  config = function()
    require('hlsearch').setup()
  end,
})

package({
  'ThePrimeagen/git-worktree.nvim',
  cmd = 'GitWorktree',
  config = function()
    require('git-worktree').setup()
  end,
})

package({
  'folke/which-key.nvim',
  config = function()
    require('which-key').setup()
  end,
})

package({ 'sindrets/diffview.nvim' })

package({ 'folke/neodev.nvim' })

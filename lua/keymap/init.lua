local keymap = require('core.keymap')
local nmap, imap, cmap, xmap, tmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap, keymap.tmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- Use space as leader key
vim.g.mapleader = ' '

-- leaderkey
nmap({ ' ', '', opts(noremap) })
xmap({ ' ', '', opts(noremap) })

-- usage example
nmap({
  -- noremal remap
  -- close buffer
  { '<C-x>k', cmd('bdelete'), opts(noremap, silent) }, -- save
  { '<C-s>', cmd('write'), opts(noremap) }, -- yank
  { 'Y', 'y$', opts(noremap) }, -- buffer jump
  { ']b', cmd('bn'), opts(noremap) },
  { '[b', cmd('bp'), opts(noremap) },
  -- remove trailing white space
  { '<Leader>t', cmd('TrimTrailingWhitespace'), opts(noremap) }, -- window jump
  { '<C-h>', '<C-w>h', opts(noremap) },
  { '<C-l>', '<C-w>l', opts(noremap) },
  { '<C-j>', '<C-w>j', opts(noremap) },
  { '<C-k>', '<C-w>k', opts(noremap) },
})

imap({
  -- insert mode
  { '<C-h>', '<Bs>', opts(noremap) },
  { '<C-e>', '<End>', opts(noremap) },
  { '<C-n>', cmd('Telescope symbols'), opts(noremap, silent) },
})

-- commandline remap
cmap({ '<C-b>', '<Left>', opts(noremap) })

-- Telescope
nmap({
  { '<Leader>b', cmd('Telescope buffers'), opts(noremap, silent) },
  { '<Leader>fg', cmd('Telescope live_grep'), opts(noremap, silent) },
  { '<Leader>ff', cmd('Telescope find_files'), opts(noremap, silent) },
  {
    '<Leader>gt',
    cmd('Telescope git_worktree git_worktrees'),
    opts(noremap, silent),
  }, -- git
  { '<Leader>gc', cmd('Telescope git_commits'), opts(noremap, silent) },
  { '<Leader>gb', cmd('Telescope git_branches'), opts(noremap, silent) },
  { '<Leader>gs', cmd('Telescope git_status'), opts(noremap, silent) },
  { '<Leader>gh', cmd('Telescope git_stash'), opts(noremap, silent) },
  {
    '<Leader>gd',
    cmd('Telescope git_diffs  diff_commits'),
    opts(noremap, silent),
  },
  {
    '<Leader>wtc',
    cmd('Telescope git_worktree create_git_worktree'),
    opts(noremap, silent),
  },
  { '<Leader>wts', cmd('Telescope git_worktree'), opts(noremap, silent) },
  { '<Leader>lz', cmd('Telescope lazy'), opts(noremap, silent) },
  { '<Leader>dv', cmd('DiffviewFileHistory %'), opts(noremap, silent) },
  { '<Leader>dc', cmd('DiffviewClose'), opts(noremap, silent) },
})

-- terminal
nmap({
  { '<Leader>tv', cmd('ToggleTerm direction=vertical'), opts(noremap, silent) },
  {
    '<Leader>th',
    cmd('ToggleTerm direction=horizontal'),
    opts(noremap, silent),
  },
  { '<Leader>ft', cmd('ToggleTerm direction=float'), opts(noremap, silent) },
})

-- lazy
nmap({
  { '<Leader>pu', cmd('Lazy update'), opts(noremap, silent) },
  { '<Leader>pi', cmd('Lazy install'), opts(noremap, silent) }, -- dashboard
})

-- help tools
nmap({
  { '<Leader>e', cmd('NvimTreeToggle'), opts(noremap, silent) }, -- Telescope
  { '<Leader>bf', cmd('NvimTreeFindFile'), opts(noremap, silent) },
  { '<Leader>tt', cmd('Trouble diagnostics toggle filter.buf=0'), opts(noremap, silent) },
  { '<Leader>tx', cmd('Trouble diagnostics toggle'), opts(noremap, silent) },
  { '<Leader>ts', cmd('Trouble symbols toggle focus=false'), opts(noremap, silent) },
  -- plugin manager: Lazy.nvim
  { '<Leader>n', cmd('DashboardNewFile'), opts(noremap, silent) },
  { '<Leader>ss', cmd('SessionSave'), opts(noremap, silent) },
  { '<Leader>sl', cmd('SessionLoad'), opts(noremap, silent) }, -- nvimtree
  -- buffer line
  { '<C-h>', cmd('BufferLineCyclePrev'), opts(noremap, silent) },
  { '<C-l>', cmd('BufferLineCycleNext'), opts(noremap, silent) },
})

-- ToggleTerm
tmap({ '<esc>', '<C-\\><C-n>', opts(noremap, silent) })

-- lspsage
nmap({
  { 'gh', cmd('Lspsaga tyd+ref+imp+def'), opts(noremap, silent) },
  { 'gi', cmd('Lspsaga incoming_calls'), opts(noremap, silent) },
  { 'go', cmd('Lspsaga outgoing_calls'), opts(noremap, silent) },
  { 'gdv', cmd('Lspsaga goto_definition vsplit'), opts(noremap, silent) },
  { 'gds', cmd('Lspsaga goto_definition split'), opts(noremap, silent) },
  { 'gdd', cmd('Lspsaga goto_definition'), opts(noremap, silent) },
  { 'gk', cmd('Lspsaga hover_doc'), opts(noremap, silent) },
  { 'gr', cmd('Lspsaga rename'), opts(noremap, silent) },
  { 'gg', cmd('Lspsaga outline'), opts(noremap, silent) },
  { 'gn', cmd('Lspsaga finder imp'), opts(noremap, silent) },
  { 'ga', cmd('Lspsaga code_action'), opts(noremap, silent) },
  { 'gf', cmd('Lspsaga finder'), opts(noremap, silent) },
})

-- lint and fmt
nmap({ '<Leader>cf', cmd('GuardFmt'), opts(noremap, silent) })

-- session config
nmap({
  { '<Leader>ss', cmd('SessionSave'), opts(noremap, silent) },
  { '<Leader>sl', cmd('SessionLoad'), opts(noremap, silent) },
  { '<Leader>st', cmd('Telescope persisted'), opts(noremap, silent) },
  { '<Leader>sb', cmd('SessionStart'), opts(noremap, silent) },
  { '<Leader>se', cmd('SessionStop'), opts(noremap, silent) },
})

-- git
nmap({
  { '<Leader>gd', cmd('GitSigns diffthis'), opts(noremap, silent) },
  { '<leader>gyr', cmd('GitSigns reset_buffer'), opts(noremap, silent) },
  { '<leader>gp', cmd('GitSigns preview_hunk'), opts(noremap, silent) },
})

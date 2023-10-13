-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'opts'
vim.g.ft_theme = 'tokyonight'
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require 'plug'
-- require('theme').change_theme(vim.g.ft_theme)
require('keymaps').basic()

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

require('keymaps').telescope()
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
require 'config.mason'
require 'config.lsp.rust'
require 'config.lsp.ts'
require 'config.treesitter'
require 'cmd'
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
local group = vim.api.nvim_create_augroup('__env', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '.env',
  group = group,
  callback = function(args)
    vim.diagnostic.disable(args.buf)
  end,
})

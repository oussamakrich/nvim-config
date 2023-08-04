-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
  'tpope/vim-fugitive',
  'machakann/vim-sandwich',
  'mg979/vim-visual-multi',
  { 'abellaismail7/42header.nvim', ft = { 'c', 'cpp' } },
  { '42Paris/42header', ft = { 'c', 'cpp' } },
  -- utils
  'github/copilot.vim',
  { 'folke/todo-comments.nvim', opts = {} },
  { 'tiagovla/scope.nvim', opts = {} },
  { 'akinsho/toggleterm.nvim', config = 'require"config.term"' },
  { 's1n7ax/nvim-window-picker', config = 'require"config.win_picker"' },
  { 'windwp/nvim-autopairs', config = 'require("nvim-autopairs").setup{}' },
  { 'kevinhwang91/nvim-bqf', ft = 'qf', opts = {
    magic_window = true,
  } },
  { 'akinsho/bufferline.nvim', version = '*', dependencies = 'nvim-tree/nvim-web-devicons', config = require 'config.tabline' },
  { 'akinsho/toggleterm.nvim', version = '*', config = require 'config.term' },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({ '*' }, { mode = 'foreground' })
    end,
  },
  {
    'ray-x/lsp_signature.nvim',
    opts = {
      bind = false,
      floating_window = false,
      transparency = 10,
      handler_opts = {
        border = 'single',
      },
      toggle_key = '<M-x>',
    },
  },
  {
    'windwp/nvim-ts-autotag',
    ft = { 'typescript', 'typescriptreact' },
    opts = {
      enable = true,
    },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      's1n7ax/nvim-window-picker',
    },
    config = function()
      require 'config.nvimtree'
    end,
  },
  {
    'cshuaimin/ssr.nvim',
    module = 'ssr',
    -- Calling setup is optional.
    opts = {
      border = 'rounded',
      min_width = 50,
      min_height = 5,
      max_width = 120,
      max_height = 25,
      keymaps = {
        close = 'q',
        next_match = 'n',
        prev_match = 'N',
        replace_confirm = '<cr>',
        replace_all = '<leader><cr>',
      },
    },
  },
  {
    'folke/edgy.nvim',
    event = 'VeryLazy',
    opts = require 'config.edgy',
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nordic').setup {
        override = {
          BqfPreviewBorder = { fg = '#ffffff' },
          EdgyNormal = { link = 'NeoTreeNormal' },
          EdgyTitle = { link = 'NeoTreeNormal' },
          EdgyIcon = { link = 'NeoTreeNormal' },
          EdgyIconActive = { link = 'NeoTreeNormal' },
        },
        telescope = {
          style = 'classic',
        },
        transparent_bg = false,
      }
      require('nordic').load()
    end,
  },
}

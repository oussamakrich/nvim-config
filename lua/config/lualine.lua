local c = require 'nordic.colors'
local lsp_status = require 'lsp-status'

local function relative_file()
  return vim.fn.expand '%:~:.'
end

local function lsp_progress()
  return lsp_status.status()
end

require('lualine').setup {
  options = {
    theme = 'nordic',
    icons_enabled = true,
    -- theme = get_colors(),
    component_separators = '',
    section_separators = '',
  },
  sections = {
    lualine_a = { { 'mode', icon = { '' }, separator = { right = ' ', left = '' } } },
    lualine_b = {
      { 'branch', icon = { '' } },
      { relative_file, separator = { right = ' ', left = '' } },
    },
    lualine_c = {
      'diagnostics',
      {
        'diff',
        symbols = { added = ' ', modified = ' ', removed = ' ' }, -- Changes the symbols used by the diff.
      },
      lsp_progress,
    },
    lualine_x = { 'encoding', 'fileformat' },
    lualine_y = {
      { 'filetype', separator = { right = ' ', left = '' } },
    },
    lualine_z = {
      {
        'location',
        icon = { '', align = 'left', color = { fg = c.black } },
      },
      {
        'progress',
        icon = { '', align = 'left', color = { fg = c.black } },
        separator = { right = '', left = '' },
      },
    },
  },
}

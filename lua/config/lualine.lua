local colors = require('theme').get_theme_tb 'base_30'

local b = { bg = colors.darker_black, fg = colors.white }
local c = { bg = colors.darker_black, fg = colors.gray }

function get_colors()
  return {
    normal = {
      a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
      b = { bg = colors.darker_black, fg = colors.white },
      c = { bg = colors.darker_black, fg = colors.gray },
    },
    insert = {
      a = { bg = colors.green, fg = colors.black, gui = 'bold' },
      b = { bg = colors.darker_black, fg = colors.white },
      c = { bg = colors.darker_black, fg = colors.gray },
    },
    visual = {
      a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
      b = { bg = colors.darker_black, fg = colors.white },
      c = { bg = colors.darker_black, fg = colors.gray },
    },
    replace = {
      a = { bg = colors.red, fg = colors.black, gui = 'bold' },
      b = { bg = colors.darker_black, fg = colors.white },
      c = { bg = colors.darker_black, fg = colors.gray },
    },
    command = {
      a = { bg = colors.orange, fg = colors.black, gui = 'bold' },
      b = { bg = colors.darker_black, fg = colors.white },
      c = { bg = colors.darker_black, fg = colors.gray },
    },
    inactive = {
      a = { bg = colors.darkgray, fg = colors.gray, gui = 'bold' },
      b = { bg = colors.darker_black, fg = colors.white },
      c = { bg = colors.darker_black, fg = colors.gray },
    },
  }
end

function relative_file()
  return vim.fn.expand '%:~:.'
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
    lualine_a = { 'mode' },
    lualine_b = {
      --[[ { 'branch', icons_enabled = false },
      {
        'diff',
        symbols = { added = ' ', modified = ' ', removed = ' ' }, -- Changes the symbols used by the diff.
      }, ]]
      --,
    },
    lualine_c = { relative_file, 'diagnostics' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
}

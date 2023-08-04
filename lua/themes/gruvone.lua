local M = {}

M.base_30 = {
  white = '#abb2bf',
  darker_black = '#232323',
  black = '#1c2021', --  nvim bg
  black2 = '#2e2e2e',
  one_bg = '#1c2021',
  one_bg2 = '#21252A',
  one_bg3 = '#444444',
  grey = '#4b4b4b',
  grey_fg = '#4e4e4e',
  grey_fg2 = '#505050',
  light_grey = '#656565',
  red = '#fb4934',
  baby_pink = '#cc241d',
  pink = '#ff75a0',
  line = '#36393a', -- for lines like vertsplit
  green = '#b8bb26',
  vibrant_green = '#a9b665',
  nord_blue = '#83a598',
  blue = '#458588',
  yellow = '#d79921',
  sun = '#fabd2f',
  purple = '#b4bbc8',
  dark_purple = '#d3869b',
  teal = '#749689',
  orange = '#e78a4e',
  cyan = '#82b3a8',
  statusline_bg = '#2c2c2c',
  lightbg = '#3d3d3d',
  pmenu_bg = '#83a598',
  folder_bg = '#749689',
}

M.base_16 = {
  base00 = '#1c2021',
  base01 = '#2F343E',
  base02 = '#423e3c',
  base03 = '#484442',
  base04 = '#bdae93',
  base05 = '#d5c4a1',
  base06 = '#ebdbb2',
  base07 = '#fbf1c7',
  base08 = '#83a498',
  base09 = '#BF966B',
  base0A = '#b58900',
  base0B = '#859900',
  base0C = '#2aa198',
  base0D = '#268bd2',
  base0E = '#CF7277',
  base0F = '#d30102',
}

vim.opt.bg = 'dark'

M = require('theme').override_theme(M, 'gruvone')

return M

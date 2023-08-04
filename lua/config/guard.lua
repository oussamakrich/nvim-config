local ft = require 'guard.filetype'

ft('c'):fmt('clang-format'):lint 'clang-tidy'

ft('javascript'):fmt 'prettier'
ft('typescript'):fmt 'prettier'
ft('javascriptreact'):fmt 'prettier'
ft('typescriptreact'):fmt 'prettier'

ft('lua'):fmt 'stylua'
-- call setup LAST
require('guard').setup {
  -- the only option for the setup function
  fmt_on_save = true,
}

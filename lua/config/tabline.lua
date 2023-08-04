return function()
  require('bufferline').setup {
    options = {
      offsets = {
        {
          filetype = 'neo-tree',
          text = '---------',
          text_align = 'left',
          separator = false,
        },
      },
    },
  }
end

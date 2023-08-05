return function()
  require('bufferline').setup {
    options = {
      offsets = {
        {
          filetype = 'neo-tree',
          text = '󰙅 NEO TREE',
          text_align = 'left',
          separator = false,
          highlight = 'TITLE',
        },
      },
    },
  }
end

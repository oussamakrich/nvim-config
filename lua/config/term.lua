local M = {}

function M.new_terminal()
  local Terminal = require('toggleterm.terminal').Terminal
  local term = Terminal:new { cmd = 'zsh' }
  term:toggle()
end

function M.toggle_last()
  print(require('toggleterm.terminal').__next_id)
end

function M.toggle_all()
  require('toggleterm').toggle_all()
end

function M.setup()
  require('toggleterm').setup {
    open_mapping = nil,
    insert_mappings = false,
    shade_terminals = false,
    --	direction = "float",
    float_opts = {
      border = 'single',
      winblend = 3,
    },
    winbar = {
      enabled = false,
      name_formatter = function(term) --  term: Terminal
        return '  Terminal[' .. term.name .. ']'
      end,
    },
  }
end

return M

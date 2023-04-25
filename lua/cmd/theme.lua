local api = vim.api;

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

-- push hl_dir file names to table
local th_files = vim.fn.stdpath "config" .. "/lua/themes"
local theme_tb = {}

for _, file in ipairs(vim.fn.readdir(th_files)) do
  if vim.fn.isdirectory(file) == 0
  then
    local s = string.gsub(file, ".lua", "")
    table.insert(theme_tb, s)
  end
end


local colors = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "colors",
    finder = finders.new_table {
      results = theme_tb
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()

        require "theme".change_theme(selection[1])
      end)
      return true
    end,
  }):find()
end

api.nvim_create_user_command("Thm", function(_, _, _)
  colors()
end, { bang = true, desc = 'Create an ortodox canonical class' })

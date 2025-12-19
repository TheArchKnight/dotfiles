local builtin = require('telescope.builtin')
local keymap = vim.keymap.set
local telescope = require('telescope')

-- Function to load ignore patterns from a .telescope_ignore file
local function load_telescope_ignore()
  local ignore_file = vim.fn.getcwd() .. "/.telescope_ignore"
  local patterns = { "node_modules", "env", "__pycache__" } -- Default ignore patterns

  local f = io.open(ignore_file, "r")
  if f then
    for line in f:lines() do
      table.insert(patterns, line)
    end
    f:close()
  end

  return patterns
end

telescope.setup{
  defaults = {
    file_ignore_patterns = load_telescope_ignore()
  }
}

telescope.load_extension('projects')

vim.api.nvim_create_autocmd("DirChanged", {
  callback = function()
    require("telescope").setup{
      defaults = {
        file_ignore_patterns = load_telescope_ignore()
      }
    }
    print("Telescope ignore patterns reloaded for new directory!")
  end
})

-- Key mappings
keymap('n', '<leader>ff', builtin.find_files, {})
keymap('n', '<leader>fg', builtin.live_grep, {})
keymap('n', '<leader>fb', builtin.buffers, {})
keymap('n', '<leader>fh', builtin.help_tags, {})
keymap('n', '<Space>p', ':Telescope projects<CR>', {})


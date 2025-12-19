-- Leader key
vim.g.mapleader = ","

-- Line numbers
vim.wo.number = true

-- Key mappings
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

local function switch_buffers()
    vim.cmd('bd') -- Close the alternate buffer
    vim.cmd('bp') -- Switch to previous buffer

end

local function split_and_open(order)
    vim.cmd('below ' .. order .. 'split | bp')
end

-- Yank to system clipboard
keymap('v', '<Leader>y', '"+y', { noremap = true })
keymap('v', '<Leader>b', '"+p', { noremap = true })


-- Window navigation
keymap('n', '<A-Up>', ':wincmd k<CR>', opts)
keymap('n', '<A-Down>', ':wincmd j<CR>', opts)
keymap('n', '<A-Left>', ':wincmd h<CR>', opts)
keymap('n', '<A-Right>', ':wincmd l<CR>', opts)

-- Terminal and split commands
keymap('n', '<Leader>tv', ':below vsplit | term<CR>', {})
keymap('n', '<Leader>th', ':belowright 15split | terminal<CR>', {})
keymap('n', '<Leader>v', function() split_and_open("v") end, {})
keymap('n', '<Leader>h', function() split_and_open("") end, {})

-- Buffer navigation
keymap('n', '<Leader>n', ':bn<CR>', {})
keymap('n', '<Leader>p', ':bp<CR>', {})

-- Miscellaneous
keymap('n', 'm', '@', { noremap = true })

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
  end,
})

keymap('n', '<Leader>d', ':bd<CR>', opts)

-- Tab settings
vim.cmd([[
  set tabstop=2
  set shiftwidth=2
  set expandtab
]])


-- Function to open all links in the selected range
function OpenAllLinks()
  -- Get the start and end positions of the visual selection
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  
  -- Extract line numbers from the positions (the second element is the line number)
  local start_line = start_pos[2]
  local end_line = end_pos[2]

  local links = {}

  -- Loop through the selected lines
  for i = start_line, end_line do
    local line = vim.fn.getline(i)
    -- Find all URLs (simple regex for http(s) links)
    for url in string.gmatch(line, "https?://[%w-_%.%?%.:/%+=&]+") do
      table.insert(links, url)
    end
  end

  -- Open each link found
  for _, link in ipairs(links) do
    vim.fn.jobstart({"xdg-open", link}, {cwd = vim.fn.expand('%:p:h')}) -- use 'start' or 'open' based on your OS
  end
end

-- Create a keybinding in visual mode for '<leader>gx'
vim.api.nvim_set_keymap('v', '<leader>gx', [[:lua OpenAllLinks()<CR>]], { noremap = true, silent = true })


vim.keymap.set('n', '<leader>td', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true })

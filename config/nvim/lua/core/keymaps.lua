vim.g.mapleader = ","
vim.wo.number = true
vim.api.nvim_set_keymap('n', '<Leader>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-Up>', ':wincmd k<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<A-Down>', ':wincmd j<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<A-Left>', ':wincmd h<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<A-Right>', ':wincmd l<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tv', ':below vsplit term://bash<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>th', ':below term<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>v', ':below vert new<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>h', ':below new<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>c', ':source ~/.config/nvim/init.lua<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>n', ':bn<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>p', ':bp<CR>',{})
vim.api.nvim_set_keymap('n', 'm', '@', { noremap = true })
-- Define the keybinding and function
vim.api.nvim_set_keymap('n', '<leader>d', [[<cmd>lua my_switch_buffers()<CR>]], { noremap = true, silent = true })

-- Switch buffers function
function my_switch_buffers()
    vim.cmd('bp') -- Switch to previous buffer
    vim.cmd('sp') -- Split current window and open alternate buffer
    vim.cmd('bn') -- Switch to next buffer
    vim.cmd('bd') -- Close the alternate buffer
end




vim.g.vimwiki_list = {
  { path = '~/my_wiki/', syntax = 'markdown', ext = '.md' }
}


-- Set the tab width to 4 spaces
vim.cmd('set tabstop=3')
vim.cmd('set shiftwidth=3')
vim.cmd('set expandtab')


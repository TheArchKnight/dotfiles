require("core.plugins")
require("core.keymaps")
require("core.plugin_config")


vim.cmd('autocmd BufNewFile,BufRead *.ipynb set filetype=ipynb')
-- Set Python indentation options to 2 spaces
vim.api.nvim_exec([[
  autocmd FileType python setlocal shiftwidth=2 tabstop=2 expandtab
]], false)
vim.api.nvim_exec([[
  autocmd FileType lobster setlocal shiftwidth=2 tabstop=2 expandtab
]], false)



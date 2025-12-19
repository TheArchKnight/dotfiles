require("core.plugins")
require("core.keymaps")
require("core.plugin_config")

vim.g.direnv_inherit = 1
vim.g.direnv_silent = 1

-- Configurar vim-direnv para ejecutar direnv allow automáticamente
vim.cmd([[
autocmd! user FileType NvimTree,Bqf,Wqf,Dap
autocmd FileType * silent! !direnv allow
autocmd BufNewFile,BufRead *.gs setfiletype genie
autocmd FileType javascript setlocal shiftwidth=4 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal expandtab
autocmd FileType typescriptreact setlocal shiftwidth=4 tabstop=2 softtabstop=2
autocmd FileType vue setlocal shiftwidth=4 tabstop=2 softtabstop=2
autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
autocmd FileType typescriptreact setlocal expandtab
autocmd FileType python setlocal shiftwidth=4 tabstop=4 
autocmd BufNewFile,BufRead *.csv   set filetype=csv_semicolon
autocmd BufNewFile,BufRead *.dat   set filetype=csv_pipe
]])


-- Enable auto-indentation and smart indentation
vim.o.autoindent = true
vim.o.smartindent = true

local function vimwiki_to_html()
  local file = vim.fn.expand('%:p')
  local html_output = string.gsub(file, '%.md', '.html')
  local cmd = 'pandoc ' .. file .. ' -o ' .. html_output

  -- Ejecutar el comando de shell
  vim.fn.system(cmd)

  -- Mostrar un mensaje cuando esté completo
  print('Converted ' .. file .. ' to HTML')
end

-- Asignar el mapeo a una tecla (por ejemplo, <leader>wh)
vim.keymap.set('n', '<leader>wh', function() vimwiki_to_html() end, { noremap = true, silent = true })

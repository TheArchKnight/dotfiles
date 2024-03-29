require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed= {"lua_ls", "pyright", "lemminx", "cssls"}
})

local on_attach = function(_,_)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
require("lspconfig").pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities

}
require("lspconfig").lemminx.setup {
  on_attach = on_attach,
  capabilities = capabilities

}

require("lspconfig").cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities

}
require("lspconfig").tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
require("lspconfig").volar.setup {
  on_attach = on_attach,
  capabilities = capabilities
}






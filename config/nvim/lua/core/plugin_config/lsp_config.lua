require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pylsp", "cssls", "html"}
})

local on_attach = function(client, bufnr)
    -- Disable diagnostics only for clangd
  if client.name == "clangd" then
    --vim.diagnostic.disable(bufnr)
  end
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.format()<CR>", {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require("lspconfig")

local servers = {"cssls", "bashls", "sqlls", "intelephense", "volar", "lemminx", "glsl_analyzer", "cmake", "docker_compose_language_service", "ccls"}

local mason_registry = require('mason-registry')

local vue_language_server_path = vim.fn.expand '$MASON/packages' .. '/vue-language-server' .. '/node_modules/@vue/language-server'


local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}

local ts_ls_config = {
  init_options = {
    plugins = {
      vue_plugin,
    },
  },
  filetypes = tsserver_filetypes,
}


local vue_ls_config = {}

vim.lsp.config('vue_ls', vue_ls_config)
vim.lsp.config('ts_ls', ts_ls_config)
vim.lsp.enable({'ts_ls', 'vue_ls'}) -- If using `ts_ls` replace `vtsls` to `ts_ls`


require'lspconfig'.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
}

for _, server in ipairs(servers) do
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities
  }

  lspconfig[server].setup(opts)
end

lspconfig.emmet_language_server.setup({
 filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
  on_attach = function(client, bufnr)
    if vim.bo[bufnr].filetype == "vue" then
      client.stop() -- immediately stop if in a Vue file
    end
  end,  -- **Note:** only the options listed in the table are supported.
  init_options = {
    --- @type string[]
    excludeLanguages = {},
    --- @type string[]
    extensionsPath = {},
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = false,
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
    syntaxProfiles = {},
    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
    variables = {},
  },
})
--lspconfig.clangd.setup {
--  cmd = {
--    "clangd",
--    "--query-driver=/usr/bin/arm-none-eabi-g++",
--    "--compile-commands-dir=build",
--    "--all-scopes-completion",
--    "--clang-tidy",
--    "--log=verbose",
--    "--header-insertion=iwyu",
--    "--fallback-style=LLVM",
--  },
--  on_attach = on_attach,
--  capabilities = capabilities
--}


lspconfig.html.setup({
  filetypes = {'html', 'htmldjango'},
  on_attach = on_attach,
  capabilities = capabilities
})

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
  },
})

vim.diagnostic.config({
  virtual_text = true,  -- Enable inline error/warning text
  signs = true,         -- Show signs in the sign column
  underline = true,     -- Underline problem areas
  update_in_insert = false,
})

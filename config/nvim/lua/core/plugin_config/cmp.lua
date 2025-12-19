local cmp = require("nvim-cmp")

cmp.setup({
  sources = {
    { name = "luasnip" },
  },

  snippet = {
    expand = function(args)
      local luasnip = require("luasnip")
      if not luasnip then
        return
      end
      luasnip.lsp_expand(args.body)
    end,
  },
})

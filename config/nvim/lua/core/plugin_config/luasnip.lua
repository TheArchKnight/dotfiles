local luasnip = require('luasnip')

-- Set up LuaSnip (you can add other configurations here if necessary)
luasnip.config.set_config({
    history = true, -- Keep around last snippet to jump back to it
    updateevents = "TextChanged,TextChangedI", -- Update snippets as you type
})

-- Load Odoo snippets from the odoo-snippets repository
require("luasnip.loaders.from_vscode").load({
    paths = { vim.fn.stdpath("data") .. "/site/pack/packer/start/odoo-snippets" }
})

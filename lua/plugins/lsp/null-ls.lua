local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

print("HHHAAAAAA")
null_ls.setup({
		debug = true,
	source = {
		formatting.stylua,
	},
})

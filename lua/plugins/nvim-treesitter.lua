require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"go",
		"javascript",
		"lua",
		"rust",
	},
	highlight = {
		-- `false` will disable the whole extension
		enable = true,
	},
  autopairs = {
		enable = true,
	}		
})

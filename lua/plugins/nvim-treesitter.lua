require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"go",
		"javascript",
		"lua",
		"rust",
		"vim",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		-- `false` will disable the whole extension
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	autopairs = {
		enable = true,
	}
})

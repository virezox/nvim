local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use("wbthomason/packer.nvim") -- Packer can manage itself
  use("nvim-lua/plenary.nvim")
  use("numToStr/Comment.nvim")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")
  use("nvim-lualine/lualine.nvim")
  use("akinsho/bufferline.nvim")
  use("akinsho/toggleterm.nvim")
  use("ahmedkhalf/project.nvim")
  use("windwp/nvim-autopairs")
  use("lewis6991/impatient.nvim")

  use("goolord/alpha-nvim")

  -- Colorschemes
  use("EdenEast/nightfox.nvim")

  -- cmp plugins
  use("hrsh7th/nvim-cmp") -- Autocompletion plugin
  use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
  use("L3MON4D3/LuaSnip") -- Snippets plugin
  use("petertriho/cmp-git")

  -- snippets

  -- LSP
  use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP
  use("jose-elias-alvarez/null-ls.nvim")

  -- Telescope
  use("nvim-telescope/telescope.nvim")

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })

  -- Git
  use("lewis6991/gitsigns.nvim")

  -- DAP
  use("mfussenegger/nvim-dap")
  use("rcarriga/nvim-dap-ui")
  use("theHamsta/nvim-dap-virtual-text")
  use("nvim-telescope/telescope-dap.nvim")
  use("rcarriga/cmp-dap")
  use("leoluz/nvim-dap-go")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

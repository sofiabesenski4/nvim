-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


local plugins = {
  -- colour scheme
  {
    "neanias/everforest-nvim"
  },

  {"github/copilot.vim"},

  -- for navigating between the nvim windows using CTRL+h/j/k/l
  {"christoomey/vim-tmux-navigator"},

  -- for focusing and minimizing windows
  {
    'declancm/maximize.nvim',
    config = true
  },

  -- for using ds/di etc and quickly modifying text with brackets/etc.
  {"tpope/vim-surround"},

  -- for functions that are d in more complex lua setups
  {"nvim-lua/plenary.nvim"},

  -- file explorer
  {"nvim-tree/nvim-tree.lua"},

  -- status line
  {"nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- Telescope
  {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
  {"nvim-telescope/telescope.nvim", branch = "0.1.x" },

  -- managing and installing lsp servers
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim"},
  {"neovim/nvim-lspconfig"}
}

-- Setup lazy.nvim
require("lazy").setup(plugins, {})

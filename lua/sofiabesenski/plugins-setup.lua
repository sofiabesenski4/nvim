-- Run $ nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
-- to download and configure new neovim plugins

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


local status, packer = pcall(require, "packer")
if not status then 
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")

  -- literally just a git repo
  use("bluz71/vim-nightfly-guicolors")

  -- for navigating between the nvim windows using CTRL+h/j/k/l 
  use("christoomey/vim-tmux-navigator")

  -- for focusing and minimizing windows
  use("szw/vim-maximizer")

  -- for using ds/di etc and quickly modifying text with brackets/etc.
  use("tpope/vim-surround")
  
  -- for functions that are used in more complex lua setups
  use("nvim-lua/plenary.nvim")

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- status line
  use{"nvim-lualine/lualine.nvim",
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Telescope
  use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})
  use({"nvim-telescope/telescope.nvim", branch = "0.1.x" })


  -- autocomplete
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")

  -- snippets
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")

  -- managing and installing lsp servers
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  use("neovim/nvim-lspconfig")

  use({
    "neanias/everforest-nvim",
  })

  use ({
    "declancm/cinnamon"
  })
  
  if packer_bootstrap then
    require("packer").sync()
  end
end)

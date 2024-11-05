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

  -- colour scheme
  use({
    "neanias/everforest-nvim",
  })

  -- for navigating between the nvim windows using CTRL+h/j/k/l 
  use("christoomey/vim-tmux-navigator")

  -- for focusing and minimizing windows
  use {
    'declancm/maximize.nvim',
    config = function() require('maximize').setup() end
  }

  -- for using ds/di etc and quickly modifying text with brackets/etc.
  use("tpope/vim-surround")
  
  -- for functions that are used in more complex lua setups
  use("nvim-lua/plenary.nvim")

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- status line
  use{"nvim-lualine/lualine.nvim",
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  -- Telescope
  use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})
  use({"nvim-telescope/telescope.nvim", branch = "0.1.x" })

  -- managing and installing lsp servers
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  use("neovim/nvim-lspconfig")
  
  if packer_bootstrap then
    require("packer").sync()
  end
end)

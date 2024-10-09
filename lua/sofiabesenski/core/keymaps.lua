vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps

-- Exiting Insert Mode
keymap.set("i", "jk", "<ESC>")

-- clear highlights in normal mode easily
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- don't copy the character into a register when we delete using x.
keymap.set("n", "x", '"_x')

-- Add keybindings for splitting windows, making them equal, and closing
keymap.set("n", "<leader>|", "<C-w>v")
keymap.set("n", "<leader>-", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>x", ":close<CR>")

-- Create toggle for colour scheme
local function toggle_theme()
  if vim.opt.background:get() == "dark" then
    vim.opt.background = "light"
    -- In my case it was unnecessary to set theme directly,
    -- as tokyonight reacted to change of vim.opt.background
    -- vim.cmd("colorscheme tokyonight-day")
  else
    vim.opt.background = "dark"
    -- vim.cmd("colorscheme tokyonight-moon")
  end
end

-- also define the keymap
vim.keymap.set("n", "<leader>t", toggle_theme, {})

-- Add keybindings for navigating the windows.
keymap.set("n", "<leader><Left>", "<C-w>h")
keymap.set("n", "<leader><Down>", "<C-w>j")
keymap.set("n", "<leader><Up>", "<C-w>k")
keymap.set("n", "<leader><Right>", "<C-w>l")
keymap.set("n", "<leader>h", "<C-w>h")
keymap.set("n", "<leader>j", "<C-w>j")
keymap.set("n", "<leader>k", "<C-w>k")
keymap.set("n", "<leader>l", "<C-w>l")

-- Map :E to :Explore
keymap.set("c", "E", "Explore")

-- Maximize/restore vim windows
keymap.set("n", "<leader>z", ":MaximizerToggle<CR>")


-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")
keymap.set("n", "<leader>E", ":NvimTreeFindFileToggle<CR>")

-- telescope
keymap.set("n", "<leader>p", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>Rg", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>rg", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags


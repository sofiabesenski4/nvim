local opt = vim.opt --for conciseness

-- tabbing
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

-- appearance
opt.termguicolors = true

opt.signcolumn = "yes" 


-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- consider "-" as part of a word for >>dw, etc
opt.iskeyword:append("-")

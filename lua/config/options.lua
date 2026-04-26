-- Options tuy chinh
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Scroll
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Update time
opt.updatetime = 250

-- Enable mouse
opt.mouse = "a"

-- Disable swap/backup (dung auto-save thay the)
opt.swapfile = false
opt.backup = false

-- Undo file
opt.undofile = true

-- Completion
opt.completeopt = "menu,menuone,noselect"

-- Fold
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

-- Status line
opt.laststatus = 3

-- Command height
opt.cmdheight = 1

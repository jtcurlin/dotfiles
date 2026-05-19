local opt = vim.opt

opt.termguicolors = true -- enable 24-bit colors

opt.number = true -- line numbers
opt.relativenumber = true -- relative line numbers
opt.cursorline = true -- highlight current line

opt.tabstop = 4 -- tab width
opt.shiftwidth = 4 -- indent width
opt.expandtab = true -- use spaces instead of tabs
opt.smartindent = true -- smart auto-indenting
opt.autoindent = true -- copy indent from current line

opt.splitright = true -- vertical splits go right

opt.clipboard = "unnamedplus"

-- disable netrw to avoid conflicts with nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "

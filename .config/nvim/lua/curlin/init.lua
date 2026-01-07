-- .config/nvim/lua/curlin/init.lua

vim.g.mapleader = ' '

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- os clipboard
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

require 'curlin.lazy_init'

-- -----------------------------------------------------------------------------------------------
-- lsp
-- -----------------------------------------------------------------------------------------------

vim.lsp.enable 'basedpyright' -- enable it for matching buffers

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('curlin-lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
    map('grr', require 'telescope.builtin', lsp.references, '[G]oto [R]eferences')
    map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    map('grD', require('telescope.builtin').lsp_declaration, '[G]oto [D]eclaration')
    map('grt', require('telecope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')
  end,
})

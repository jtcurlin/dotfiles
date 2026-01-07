-- lua/curlin/lazy/lualine.lua
return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional
    config = function()
      require('lualine').setup {
        options = {
          theme = 'monokai-pro',
          section_separators = '',
          component_separators = '',
        },
      }
    end,
  },
}

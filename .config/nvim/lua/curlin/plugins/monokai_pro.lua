return {
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,           -- load immediately
    priority = 1000,        -- load before other plugins
    config = function()
      require("monokai-pro").setup({
        filter = "pro",     -- or "classic", "machine", "octagon", "ristretto", "spectrum"
		transparent_background = true,
      })

      -- actually apply the colorscheme
      vim.cmd.colorscheme("monokai-pro")
    end,
  },
}


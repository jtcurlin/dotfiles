return {
	{
		"loctvl842/monokai-pro.nvim",
		lazy = false, 		-- load immediately
		priority = 1000, 	-- load before other plugins
		config = function()
			require("monokai-pro").setup({
				filter = "pro",
				transparent_background = true,
			})
		
			vim.cmd.colorscheme("monokai-pro")
		end,
	},
}

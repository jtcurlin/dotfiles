-- .config/nvim/lua/curlin/lazy/nvim-treesitter.lua
return { 
  {
    "nvim-treesitter/nvim-treesitter", 
	branch = 'master', 
	build = ":TSUpdate",
	lazy = false, 
	config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { 
          "c", 
		  "cpp", 
		  "python", 
		  "bash", 
		  "lua", 
		  "json", 
		  "html", 
		  "javascript", 
		  "typescript", 
		  "sql", 
		  "toml", 
		  "yaml" 
	    },

	    highlight = {
		  enable = true,
		  additional_vim_regex_highlighting = false,
	    },

	    indent = {
		  enable = true,
	    },

	    incremental_selection = {
		  enable = true,
		  keymaps = {
		    init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		  },
		},
	  })
    end,
  }
}

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Explorer" },
  },
  opts = {
    view = {
      width = {
        min = 30,
        max = -1, -- -1 means no maximum
        padding = 1,
      },
    },
  },
}

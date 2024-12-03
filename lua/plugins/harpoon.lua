return {
  "ThePrimeagen/harpoon",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = true,
  enabled = false,
  keys = {
    { "<leader>m", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
    { "<leader>j", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
    { "<leader>o", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Go to previous harpoon mark" },
    { "<leader>a", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
  },
  init = function()
    require("harpoon").setup({ menu = { width = 100 } })
  end,
}

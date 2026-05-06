return {
  "sindrets/diffview.nvim",
  cmd = {
    "DiffviewClose",
    "DiffviewFileHistory",
    "DiffviewOpen",
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("diffview").setup({})
  end,
}

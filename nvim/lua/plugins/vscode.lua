return {
  "Mofiqul/vscode.nvim",
  priority = 1000,
  config = function()
    require("vscode").setup({
      style = "dark",       -- "dark" for Dark+, "light" for Light+
      transparent = false,
      italic_comments = true,
      disable_nvimtree_bg = true,
      group_overrides = {}, -- optional custom highlights
    })
    vim.cmd.colorscheme("vscode")
  end,
}

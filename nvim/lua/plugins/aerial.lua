return {
	"stevearc/aerial.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("aerial").setup({
			highlight_on_jump = 200,
			nav = {
				max_width = 1,
				min_width = { 0.7, 100 },
			},
		})
	end,
}

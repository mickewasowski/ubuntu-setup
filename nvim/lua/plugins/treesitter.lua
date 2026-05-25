return {
	"nvim-treesitter/nvim-treesitter",

	branch = "main",

	dependencies = { "windwp/nvim-ts-autotag" },

	lazy = false,

	build = function()
		if vim.fn.executable("tree-sitter") == 1 then
			vim.cmd("TSUpdate")
		end
	end,

	init = function()
		local ensure_installed = {
			"c",
			"cpp",

			"bash",
			"diff",

			"lua",
			"vim",
			"vimdoc",

			"query",
			"sql",

			"markdown",
			"markdown_inline",

			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"jsdoc",

			"json",
			"csv",
			"yaml",
			"toml",

			"glsl",
			"hlsl",

			"comment",
		}

		if vim.fn.executable("tree-sitter") == 1 then
			local installed = require("nvim-treesitter.config").get_installed()
			local missing = vim
				.iter(ensure_installed)
				:filter(function(parser)
					return not vim.tbl_contains(installed, parser)
				end)
				:totable()

			if #missing > 0 then
				require("nvim-treesitter").install(missing)
			end
		else
			vim.schedule(function()
				vim.notify(
					"nvim-treesitter: install tree-sitter CLI to build parsers (:help nvim-treesitter-install)",
					vim.log.levels.WARN
				)
			end)
		end

		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,

	config = function()
		pcall(function()
			require("nvim-ts-autotag").setup()
		end)
	end,
}

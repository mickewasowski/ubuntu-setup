return {
  {
    'nvim-telescope/telescope.nvim',
    -- dependencies = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim', 'nvim-telescope/telescope-media-files.nvim' },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          preview = {
            treesitter = {
              enable = false,
            },
          },
          mappings = {
            i = {
              ["<Esc>"] = { "<Esc>", type = "command" },
              ["<BS>"] = { "<BS>", type = "command" },
              ["<C-h>"] = false,
              ["<C-c>"] = "close",
            },
            n = {
              ["<Esc>"] = false,
              ["q"] = "close",
            },
          },
        },
      })

      local builtin = require("telescope.builtin")
    end
  },
  -- {
  --   "nvim-telescope/telescope-ui-select.nvim",
  --   config = function()
  --     require("telescope").setup {
  --       extensions = {
  --         ["ui-select"] = {
  --           require("telescope.themes").get_dropdown {
  --             -- even more opts
  --           }
  --         },
  --         ["media_files"] = {
  --           filetypes = {"png", "webp", "jpg", "jpeg"},
  --           -- find command (defaults to `fd`)
  --           find_cmd = "rg"
  --         },
  --       }
  --     }
  --     require("telescope").load_extension("ui-select")
  --     require("telescope").load_extension('media_files')
  --   end
  -- }
}

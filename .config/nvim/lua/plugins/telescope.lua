return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<S-CR>"] = require("telescope.actions").select_vertical,
          ["<C-CR>"] = require("telescope.actions").select_horizontal,
        },
        n = {
          ["<S-CR>"] = require("telescope.actions").select_vertical,
          ["<C-CR>"] = require("telescope.actions").select_horizontal,
        },
      },
    },
  },
}

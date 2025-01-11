return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = { },
  config = function()
    require("lualine").setup {
      options = {
        always_divide_middle = false,
        icons_enabled = true,
        --theme = "kanagawa",
      },
      sections = {
        lualine_c = { "filename", require("doing").status, },
      },
    }
  end,
}

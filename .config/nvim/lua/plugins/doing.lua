return {
  "Hashino/doing.nvim",
  config = function()
    require("doing").setup {
      doing_prefix = "Doing: ",
      winbar = { enabled = false, },
    }
  end
}

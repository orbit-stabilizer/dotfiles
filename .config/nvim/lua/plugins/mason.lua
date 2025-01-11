return {
  "williamboman/mason.nvim",
  priority = 900,
  config = function()
    require("mason").setup()
  end,
}

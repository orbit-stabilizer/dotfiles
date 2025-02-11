return {
  "williamboman/mason-lspconfig.nvim",
  priority = 800,
  config = function()
    require("lspconfig").basedpyright.setup{}
    require("lspconfig").clojure_lsp.setup{}
    require("lspconfig").lua_ls.setup{}
    require("lspconfig").nil_ls.setup{}
    require("lspconfig").ruff.setup{}
  end
}

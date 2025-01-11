return {
  "williamboman/mason-lspconfig.nvim",
  priority = 800,
  config = function()
    require("lspconfig").clojure_lsp.setup{}
    require("lspconfig").nil_ls.setup{}
  end
}

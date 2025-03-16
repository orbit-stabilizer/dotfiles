return {
  "williamboman/mason-lspconfig.nvim",
  priority = 800,
  config = function()
    local lspconfig = require("lspconfig")
    lspconfig.basedpyright.setup{}
    lspconfig.clojure_lsp.setup{}
    lspconfig.lua_ls.setup{}
    lspconfig.nil_ls.setup{}
    lspconfig.ruff.setup{}
    lspconfig.rust_analyzer.setup{}
  end
}

return {
    "Olical/conjure",
    ft = { "clojure", "python" },
    lazy = true,
    init = function()
      -- Rebind it from K to S
      vim.g["conjure#mapping#doc_word"] = {"S"}
      -- Set configuration options here
      -- Uncomment this to get verbose logging to help diagnose internal Conjure issues
      -- This is VERY helpful when reporting an issue with the project
      -- vim.g["conjure#debug"] = true
    end,
}

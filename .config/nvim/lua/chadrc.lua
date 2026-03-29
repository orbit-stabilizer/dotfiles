-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "gruvbox",
  theme_toggle = { "gruvbox", "chadracula" },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = { enabled = false },
  telescope = { style = "bordered" },
  nvim_tree = { window = { position = "left" } },
}

return M

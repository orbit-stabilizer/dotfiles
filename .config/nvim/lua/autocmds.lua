require "nvchad.autocmds"

local map_autcmd = vim.api.nvim_create_autocmd

-- Highlighit yanked text
map_autcmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

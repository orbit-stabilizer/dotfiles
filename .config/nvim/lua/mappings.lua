local map = vim.keymap.set
-- local unmap = vim.keymap.del
local map_autcmd = vim.api.nvim_create_autocmd

-- Split window navigation
local ss = require "smart-splits"
map("n", "<A-h>", ss.resize_left)
map("n", "<A-j>", ss.resize_down)
map("n", "<A-k>", ss.resize_up)
map("n", "<A-l>", ss.resize_right)
-- moving between splits
map("n", "<C-h>", ss.move_cursor_left)
map("n", "<C-j>", ss.move_cursor_down)
map("n", "<C-k>", ss.move_cursor_up)
map("n", "<C-l>", ss.move_cursor_right)
map("n", "<C-/>", ss.move_cursor_previous)
-- swapping buffers between windows
map("n", "<C-A-h>", ss.swap_buf_left)
map("n", "<C-A-j>", ss.swap_buf_down)
map("n", "<C-A-k>", ss.swap_buf_up)
map("n", "<C-A-l>", ss.swap_buf_right)

-- Highlighit yanked text
map_autcmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

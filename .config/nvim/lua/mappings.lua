require "nvchad.mappings"

local map = vim.keymap.set
local unmap = vim.keymap.del
local map_autcmd = vim.api.nvim_create_autocmd

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Remove built-in NVChad keymaps
unmap("n", "<leader>b")
unmap("n", "<leader>fw")
unmap("n", "<leader>fm")
unmap("n", "<leader>fz")
unmap("n", "<leader>ma")
unmap("n", "<leader>th")
unmap("n", "<C-n>")
unmap("n", "<leader>h")
unmap("n", "<leader>v")
unmap("n", "<A-i>")
unmap("n", "<A-v>")
unmap("n", "<A-h>")

-- Buffer management
map("n", "<leader>bd", ":bd!<CR>", { desc = "Deletes a buffer" })
map("n", "<leader>bn", ":bn<CR>", { desc = "Go to next buffer" })
map("n", "<leader>bp", ":bp<CR>", { desc = "Go to previous buffer" })

-- Window management
map("n", "<leader>wh", "<C-w>h", { desc = "Focus on left window" })
map("n", "<leader>wj", "<C-w>j", { desc = "Focus on bottom window" })
map("n", "<leader>wk", "<C-w>k", { desc = "Focus on top window" })
map("n", "<leader>wl", "<C-w>l", { desc = "Focus on right window" })
map("n", "<leader>wd", "<C-w>c", { desc = "Delete window" })
map("n", "<leader>ws", ":split<CR>", { desc = "Split window horizontally" })
map("n", "<leader>wv", ":vsplit<CR>", { desc = "Split window vertically" })

-- Easily open Lazy
map("n", "<leader>l", ":Lazy<CR>", { desc = "Split window vertically" })

-- Telescope
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fl", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>ft", "<cmd>Telescope terms<CR>", { desc = "telescope pick terminal" })
map("n", "<leader>fT", function()
  require("nvchad.themes").open { style = "bordered" }
end, { desc = "telescope nvchad themes" })

-- Terminal
map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-t>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-;>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- Format file
map("n", "<leader>F", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- Highlighit yanked text
map_autcmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

map("n", "<leader><leader>", "<cmd>source %<CR>")
map("n", "<leader>x", ":.lua<CR>")
map("v", "<leader>x", ":lua<CR>")

-----------
-- For making the theme picker use <C-k/j> for up/down instead of <C-n/p>
-- I have to do this because NVChad uses its own picker for the theme selector
-- It does not use telescope.
-- And it offers no easy way to change the mapping as well

local state = require "nvchad.themes.state"
local nvapi = require "nvchad.themes.api"

local nvchad_internals_map = function(mode, keys, func, opts)
  for _, key in ipairs(keys) do
    vim.keymap.set(mode, key, func, opts)
  end
end

nvchad_internals_map("i", { "<C-j>", "<Down>" }, nvapi.move_down, { buffer = state.input_buf })
nvchad_internals_map("i", { "<C-k>", "<Up>" }, nvapi.move_up, { buffer = state.input_buf })

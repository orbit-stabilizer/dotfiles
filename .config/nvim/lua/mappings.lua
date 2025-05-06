require "nvchad.mappings"

local map = vim.keymap.set
local unmap = vim.keymap.del
local map_autcmd = vim.api.nvim_create_autocmd

-- Remove built-in NVChad keymaps
unmap("n", "<leader>b")
unmap("n", "<leader>fw")
unmap("n", "<leader>fm")
unmap("n", "<leader>fz")
unmap("n", "<leader>ma")
unmap("n", "<leader>th")
unmap("n", "<leader>pt") -- Remove terminal search mapping
unmap("n", "<leader>gt") -- Remove git status search because I want to remap it
unmap("n", "<leader>cm") -- Remove git commits search because I want to remap it
unmap("n", "<leader>x") -- Remove close buffer mapping
unmap("n", "<C-n>") -- Remove nvimtree toggle
unmap("n", "<leader>h")
unmap("n", "<leader>v")
unmap("n", "<A-i>")
unmap("n", "<A-v>")
unmap("n", "<A-h>")
unmap("n", "<TAB>")
unmap("n", "<S-TAB>")
unmap("n", "<C-s>")

-- Telescope
map("n", "<leader>ft", "<cmd>Telescope live_grep<CR>", { desc = "telescope find text" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map(
  "n",
  "<leader>fl",
  "<cmd>Telescope current_buffer_fuzzy_find<CR>",
  { desc = "telescope find in current (local) buffer" }
)
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "telescope search lsp document symbols" })
map("n", "<leader>fc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>fg", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>fT", function()
  require("nvchad.themes").open {
    style = "bordered",
    mappings = function()
      local nvapi = require "nvchad.themes.api"
      local state = require "nvchad.themes.state"
      map("i", "<C-n>", nvapi.move_down, { buffer = state.input_buf })
      map("i", "<C-p>", nvapi.move_up, { buffer = state.input_buf })
    end,
  }
end, { desc = "telescope nvchad themes" })

-- Format file
map("n", "<leader>F", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- Navigation
map("n", "<C-[>", "6j", { desc = "Move down by 6 lines" })
map("n", "<C-]>", "6k", { desc = "Move up by 6 lines" })

map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

map("n", "{", "}zz", { desc = "Move down" })
map("n", "}", "{zz", { desc = "Move down" })

map("n", "<TAB>", ":bn<CR>", { desc = "Go to next tab" })
map("n", "<S-TAB>", ":bp<CR>", { desc = "Go to previous tab" })

-- Remove highlight
map("n", "<leader><leader>", ":noh<CR>", { desc = "Clear highlighting" })

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

-- Remapping J K because they are used with smart-motion.nvim
map("n", "gj", ":j<CR>", { desc = "Join lines" })
map("n", "gk", vim.lsp.buf.hover, { desc = "LSP Hover" })

-- Making quickfix better
map("n", "gp", ":cp<CR>", { desc = "Go to previous quickfix list item" })
map("n", "gn", ":cn<CR>", { desc = "Go to next quickfix list item" })

-- Highlighit yanked text
map_autcmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

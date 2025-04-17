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
unmap("n", "<C-n>") -- Remove nvimtree toggle
unmap("n", "<leader>h")
unmap("n", "<leader>v")
unmap("n", "<A-i>")
unmap("n", "<A-v>")
unmap("n", "<A-h>")

-- Telescope
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fl", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "telescope search lsp document symbols" })
map("n", "<leader>fT", function()
  require("nvchad.themes").open {
    style = "bordered",
    mappings = function()
      local nvapi = require "nvchad.themes.api"
      local state = require "nvchad.themes.state"
      map("i", "<C-j>", nvapi.move_down, { buffer = state.input_buf })
      map("i", "<C-k>", nvapi.move_up, { buffer = state.input_buf })
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

-- Remove highlight
map("n", "<leader><leader>", ":noh<CR>", { desc = "Clear highlighting" })

-- Highlighit yanked text
map_autcmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

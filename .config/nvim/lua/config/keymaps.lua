-- Note: mapleader and maplocalleader are set in lazy.lua

local builtin = require("telescope.builtin")
local clay = require("config.clay")
local files = require("mini.files")

local n_keymaps = {
  buffer = {
    ["<leader>bn"] = ":bn<cr>",
    ["<leader>bp"] = ":bp<cr>",
    ["<leader>bd"] = ":bd!<cr>",
  },
  clay = {
    ["<localleader>cs"] = clay.start,
    ["<localleader>cef"] = clay.eval_form,
    ["<localleader>cn"] = clay.eval_ns,
  },
  file_explorer = {
    ["-"] = files.open,
  },
  lsp = {
    ["gb"] = "<C-t>", -- go back from defintion
    ["gd"] = vim.lsp.buf.definition,
    ["gh"] = vim.lsp.buf.hover,
    ["grr"] = vim.lsp.buf.references,
    ["grn"] = vim.lsp.buf.rename,
  },
  misc = {
    ["M"] = "J",
    ["<leader><leader>"] = ":",
  },
  navigation = {
    ["H"] = "^",
    ["J"] = "6j",
    ["K"] = "6k",
    ["L"] = "g_",
  },
  telescope = {
    ["<leader>ff"] = builtin.find_files,
    ["<leader>ft"] = builtin.live_grep,
    ["<leader>fb"] = builtin.buffers,
    ["<leader>fh"] = builtin.help_tags,
  },
  window = {
    ["<leader>wh"] = "<C-w>h",
    ["<leader>wj"] = "<C-w>j",
    ["<leader>wk"] = "<C-w>k",
    ["<leader>wl"] = "<C-w>l",
    ["<leader>wd"] = "<C-w>c",
    ["<leader>ws"] = ":split<cr>",
    ["<leader>wv"] = ":vsplit<cr>",
  },
}

local t_keymaps = {
  ["<ESC>"] = "<C-\\><C-n>",
}

local autocmds = {
  ["TextYankPost"] = function() vim.highlight.on_yank() end,
}

-- Set all keymaps
for _, keymaps in pairs(n_keymaps) do
  for k, v in pairs(keymaps) do
    vim.keymap.set("n", k, v, { noremap = true, silent = true })
  end
end

for k, v in pairs(t_keymaps) do
  vim.keymap.set("t", k, v, { noremap = true, silent = true })
end

for k, v in pairs(autocmds) do
  vim.api.nvim_create_autocmd(k, { callback = v })
end

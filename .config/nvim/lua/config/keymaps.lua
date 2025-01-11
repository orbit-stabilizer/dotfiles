-- Note: mapleader and maplocalleader are set in lazy.lua

local builtin = require("telescope.builtin")
local clay = require("config.clay")

n_keymaps = {
  window = {
    ["<leader>wh"] = "<C-w>h",
    ["<leader>wj"] = "<C-w>j",
    ["<leader>wk"] = "<C-w>k",
    ["<leader>wl"] = "<C-w>l",
    ["<leader>wd"] = "<C-w>c",
    ["<leader>ws"] = ":vsplit<cr>",
    ["<leader>wz"] = ":split<cr>",
  },
  buffer = {
    ["<leader>bn"] = ":bn<cr>",
    ["<leader>bp"] = ":bp<cr>",
    ["<leader>bd"] = ":bd!<cr>",
  },
  telescope = {
    ["<leader>ff"] = builtin.find_files,
    ["<leader>ft"] = builtin.live_grep,
    ["<leader>fb"] = builtin.buffers,
    ["<leader>fh"] = builtin.help_tags,
  },
  navigation = {
    ["H"] = "^",
    ["J"] = "6j",
    ["K"] = "6k",
    ["L"] = "g_",
  },
  clay = {
    ["<localleader>cs"] = clay.start,
    -- ["<localleader>cef"] = clay.eval_form,
    -- ["<localleader>cen"] = clay.eval_ns,
  },
  misc = {
    ["M"] = "J",
    ["<leader>h,"] = "K",
    ["<leader><leader>"] = ":",
  },
}

t_keymaps = {
  ["<ESC>"] = "<C-\\><C-n>",
}

autocmds = {
  ["TextYankPost"] = function() vim.highlight.on_yank() end,
}

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

local options = {
  number = true,
  splitbelow = true,
  splitright = true,
  wrap = false,
  expandtab = true,
  tabstop = 2,
  shiftwidth = 2,
  scrolloff = 15,
  virtualedit = "block",
  inccommand = "split",
  ignorecase = true,
  termguicolors = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.keymap.set("i", "<C-BS>", "<C-w>", { noremap = true })

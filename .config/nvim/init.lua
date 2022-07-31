require("plugins")

require"lspconfig".ccls.setup{}
require"lspconfig".rust_analyzer.setup{}
require"lspconfig".sumneko_lua.setup{}

vim.api.nvim_command("set number")
vim.api.nvim_command("colorscheme cosmic_latte")

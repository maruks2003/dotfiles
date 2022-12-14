require("plugins")

-- lsp setup
require"lspconfig".ccls.setup{}
require"lspconfig".rust_analyzer.setup{}
require"lspconfig".sumneko_lua.setup{}
require"lspconfig".bashls.setup{}
require"lspconfig".pyright.setup{}
require"lspconfig".texlab.setup{}

require"colorizer".setup()


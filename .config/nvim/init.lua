-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("lspconfig").ts_ls.setup({})
require("lspconfig").pyright.setup({})

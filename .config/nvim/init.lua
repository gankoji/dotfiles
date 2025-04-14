-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("lspconfig").ts_ls.setup({})
require("lspconfig").pyright.setup({})

local cmp = require("cmp")

cmp.setup({
  sources = {
    { name = "cmp_ai" },
  },
})

local cmp_ai = require("cmp_ai.config")

cmp_ai:setup({
  max_lines = 1000,
  provider = "OpenAI",
  provider_options = {
    model = "gpt-4",
  },
  notify = false,
  run_on_every_keystroke = true,
})

local compare = require("cmp.config.compare")
cmp.setup({
  sorting = {
    priority_weight = 2,
    comparators = {
      require("cmp_ai.compare"),
      compare.offset,
      compare.exact,
      compare.score,
      compare.recently_used,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },
})

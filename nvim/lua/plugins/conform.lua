return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "xmlformatter",
        "rust-analyzer",
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft.markdown = {}
      opts.formatters_by_ft.typescript = { "eslint_d" }
      opts.formatters_by_ft.haskell = { "stylish-haskell" }
      opts.formatters_by_ft.vue = { "eslint_d" }
      opts.formatters_by_ft.svg = { "xmlformatter" }
      opts.formatters_by_ft.rust = { "rustfmt" }
    end,
    cofig = function()
      require("conform").setup({
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_format = "fallback",
          async = true,
        },
      })
    end,
  },
}

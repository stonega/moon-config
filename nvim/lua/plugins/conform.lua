return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "xmlformatter",
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft.markdown = {}
      opts.formatters_by_ft.typescript = { "eslint_d" }
      opts.formatters_by_ft.vue = { "eslint_d" }
      opts.formatters_by_ft.svg = { "xmlformatter" }
      vim.list_extend(opts.formatters, {
        biome = {
          condition = function(ctx)
            return vim.fs.find({ "biome.json" }, { path = ctx.filename, upward = true })[1]
          end,
        },
      })
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

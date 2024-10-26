return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "vale",
        "eslint_d",
        "biome",
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft.markdown = { "vale" }
      opts.linters_by_ft.typescript = { "eslint_d" }
      opts.linters_by_ft.vue = { "eslint_d" }
    end,
  },
}

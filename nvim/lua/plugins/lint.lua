return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "eslint_d",
        "vale",
        "biome",
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters.eslint_d = {
        args = {
          "--no-warn-ignored", -- <-- this is the key argument
          "--format",
          "json",
          "--stdin",
          "--stdin-filename",
          function()
            return vim.api.nvim_buf_get_name(0)
          end,
        },
      }
      opts.linters_by_ft.markdown = { "vale" }
      opts.linters_by_ft.typescript = { "eslint_d" }
      opts.linters_by_ft.vue = { "eslint_d" }
    end,
  },
}

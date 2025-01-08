return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  opts = {
    -- add any opts here
    provider = "openai",
    auto_suggestions_provider = "copilot",
    copilot = {
      model = "claude-3-5-sonnet",
    },
    openai = {
      endpoint = "https://aihubmix.com/v1",
      model = "claude-3-5-sonnet-20241022",
      temperature = 0,
      max_tokens = 4096,
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      "OXY2DEV/markview.nvim",
      enabled = true,
      lazy = false,
      ft = { "markdown", "norg", "rmd", "org", "vimwiki", "Avante" },
      opts = {
        filetypes = { "markdown", "norg", "rmd", "org", "vimwiki", "Avante" },
        buf_ignore = {},
        max_length = 99999,
      },
    },
    -- {
    --   -- Make sure to set this up properly if you have lazy=true
    --   "MeanderingProgrammer/render-markdown.nvim",
    --   opts = {
    --     file_types = { "markdown", "Avante" },
    --   },
    --   ft = { "markdown", "Avante" },
    -- },
  },
}

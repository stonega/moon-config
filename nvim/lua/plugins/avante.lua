return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  opts = {
    -- add any opts here
    provider = "gemini",
    auto_suggestions_provider = "gemini",
    openai = {
      endpoint = "https://aihubmix.com/v1",
      model = "claude-3-5-sonnet-20241022",
      temperature = 0,
      max_tokens = 4096,
    },
    gemini = {
      endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
      model = "gemini-2.0-pro-exp-02-05",
      timeout = 30000, -- Timeout in milliseconds
      temperature = 0,
      max_tokens = 8192,
    },
    cursor_applying_provider = nil,
    behaviour = {
      auto_suggestions = false, -- Experimental stage
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
      minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
      enable_token_counting = true, -- Whether to enable token counting. Default to true.
      enable_cursor_planning_mode = false, -- Whether to enable Cursor Planning Mode. Default to false.
    },
    vendors = {
      groq = { -- define groq provider
        __inherited_from = "openai",
        api_key_name = "GROQ_API_KEY",
        endpoint = "https://api.groq.com/openai/v1/",
        model = "qwen-2.5-coder-32b",
        max_tokens = 8192, -- remember to increase this value, otherwise it will stop generating halfway
      },
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

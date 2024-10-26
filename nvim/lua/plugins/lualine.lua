-- the opts function can also be used to change the default opts:
-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    -- add this plugin as dependency for lualine
    "bwpge/lualine-pretty-path",
  },
  opts = function(_, opts)
    opts.options.theme = bubbles_theme
    opts.options.section_separators = ""
    opts.options.component_separators = ""
    opts.sections = {
      lualine_c = { "pretty_path" },
    }
    -- opts.sections.lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } }
    opts.sections.lualine_z = {
      {
        function()
          return " " .. os.date("%R")
        end,
        -- separator = { right = "" },
        left_padding = 2,
      },
    }
  end,
}

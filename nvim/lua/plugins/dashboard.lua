return {
  "nvimdev/dashboard-nvim",
  opts = function(_, opts)
    local stone = [[
|￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣|
| Don't Push To Production On Friday   |
|＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿|
                     \ (•◡•) / 
                       \    / 
                        ——
                        |  |
                        |  |
                        |_ |_ 
  ]]

    stone = string.rep("\n", 8) .. stone .. "\n\n"
    opts.config.header = vim.split(stone, "\n")
  end,
}

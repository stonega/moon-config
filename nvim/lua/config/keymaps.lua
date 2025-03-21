-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Open GitHub repository URL in browser
vim.keymap.set("n", "<leader>go", function()
  local url = vim.fn.trim(vim.fn.system("git config --get remote.origin.url"))
  url = url:gsub("%.git$", "")
  url = url:gsub("git@github.com:", "https://github.com/")

  local cmd
  cmd = { "xdg-open", url }

  vim.fn.jobstart(cmd, {
    detach = true,
    on_stderr = function(_, data)
      if data then
        vim.notify("Error opening URL: " .. vim.inspect(data), vim.log.levels.ERROR)
      end
    end,
  })
end, { desc = "Open GitHub repository in browser" })

-- Open CI/CD URL in browser
vim.keymap.set("n", "<leader>gd", function()
  local repo_url = vim.fn.trim(vim.fn.system("git config --get remote.origin.url"))
  local org_repo = repo_url:match("github.com[:/]([^/]+/[^/]+)%.git$") or ""
  local org, repo_name = org_repo:match("([^/]+)/([^/]+)$")
  local cicd_org = org == "boolnetwork" and "Github-boolnetwork" or "Github"
  local branch = vim.fn.trim(vim.fn.system("git branch --show-current"))

  -- Construct CI/CD URL
  local cicd_url = string.format("https://cicd.abmatrix.cn/job/%s/job/%s/job/%s", cicd_org, repo_name, branch)

  local cmd
  cmd = { "xdg-open", cicd_url }

  vim.fn.jobstart(cmd, {
    detach = true,
    on_stderr = function(_, data)
      if data then
        vim.notify("Error opening URL: " .. vim.inspect(data), vim.log.levels.ERROR)
      end
    end,
  })
end, { desc = "Open CI/CD pipeline in browser" })

-- Show current buffer path
vim.keymap.set("n", "<leader>pp", function()
  local path = vim.api.nvim_buf_get_name(0)
  vim.notify(path, vim.log.levels.INFO, { title = "Current Buffer Path" })
end, { desc = "Show current buffer path" })

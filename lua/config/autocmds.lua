-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

D("Loading autocmds.lua")

-- add autocmds here
local function detect_cloudformation()
  if vim.fn.search("AWSTemplateFormatVersion", "nw") > 0 then
    vim.bo.filetype = "yaml.cloudformation"
    print("Detected CloudFormation file")
  end
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.yml", "*.yaml" },
  callback = detect_cloudformation,
})

-- Add this to your init.lua or any file that's sourced during startup
vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml.cloudformation",
  callback = function()
    vim.schedule(function()
      local active_clients = vim.lsp.get_active_clients({ bufnr = 0 })
      for _, client in pairs(active_clients) do
        if client.name == "yamlls" then
          vim.lsp.stop_client(client.id)
          print("Stopped yaml-language-server")
          break
        end
      end
    end)
  end,
})

D("Loaded autocmds.lua")

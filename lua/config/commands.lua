-- My custom commands
--
print("Loading commands.lua")
-- command! MyFiles :Telescope find_files cwd=~/workspace/
-- vim.api.commands("MyFiles", "Telescope find_files cwd=~/workspace/")
-- vim.api.nvim_create_command("MyFiles", ":Telescope find_files cwd=~/workspace/", {
--   nargs = 0,
--   complete = "customlist,MyFilesComplete",
-- })

-- working with linting and formatting configurations
local function check_null_ls_sources()
  local null_ls = require("null-ls")
  local sources = null_ls.get_sources()
  local buffer_sources = vim.tbl_filter(function(source)
    return source.filetypes[vim.bo.filetype]
  end, sources)

  if #buffer_sources == 0 then
    print("No null-ls sources found for current buffer")
  else
    print("Active null-ls sources for current buffer:")
    for _, source in ipairs(buffer_sources) do
      print("- " .. source.name)
    end
  end
end

-- -- Create a command to call this function
vim.api.nvim_create_user_command("CheckNullLsSources", check_null_ls_sources, {
  nargs = 0,
})
--
-- -- You can call this function with:
-- -- :lua check_null_ls_sources()
--
--
local function check_none_ls_sources()
  local null_ls_status, null_ls = pcall(require, "null-ls")
  if not null_ls_status then
    vim.notify("none-ls is not available: " .. tostring(null_ls), vim.log.levels.WARN)
    return
  end

  local sources = null_ls.get_sources()
  print("All registered null-ls sources:")
  for _, source in ipairs(sources) do
    print(string.format("- %s (filetypes: %s)", source.name, table.concat(vim.tbl_keys(source.filetypes), ", ")))
  end

  local buffer_sources = vim.tbl_filter(function(source)
    return source.filetypes[vim.bo.filetype]
  end, sources)

  print(string.format("Current filetype: %s", vim.bo.filetype))
  if #buffer_sources == 0 then
    vim.notify(
      string.format("No null-ls sources found for current buffer (filetype: %s)", vim.bo.filetype),
      vim.log.levels.INFO
    )
  else
    local source_names = vim.tbl_map(function(source)
      return source.name
    end, buffer_sources)
    vim.notify(
      string.format("Active null-ls sources for current buffer: %s", table.concat(source_names, ", ")),
      vim.log.levels.INFO
    )
  end
end
--
-- -- Create a command to call this function
vim.api.nvim_create_user_command("CheckNoneLsSources", check_none_ls_sources, {
  nargs = 0,
})

-- vim.api.nvim_create_user_command("WorkSpaceFiles", "Telescope find_files cwd=~/workspace/", {})
print("Loaded commands.lua")

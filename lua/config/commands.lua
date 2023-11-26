-- My custom commands
--

-- command! MyFiles :Telescope find_files cwd=~/workspace/
-- vim.api.commands("MyFiles", "Telescope find_files cwd=~/workspace/")
vim.api.nvim_create_command("MyFiles", ":Telescope find_files cwd=~/workspace/", {
  nargs = 0,
  complete = "customlist,MyFilesComplete",
})

-- debug.lua
local M = {}

-- Configuration
M.DEBUG = false
M.LOG_FILE = vim.fn.stdpath("data") .. "/nvim_custom_debug.log"

-- Helper function to get current time
local function get_time()
  return os.date("%Y-%m-%d %H:%M:%S")
end

-- Function to write to log file
local function write_to_log(message)
  local file = io.open(M.LOG_FILE, "a")
  if file then
    file:write(string.format("[%s] %s\n", get_time(), message))
    file:close()
  end
end

-- Debug print function
function M.log(message)
  if M.DEBUG then
    print(string.format("[DEBUG] %s", message))
    write_to_log(message)
  end
end

-- Enable debugging
function M.enable()
  M.DEBUG = true
  M.log("Debugging enabled")
end

-- Disable debugging
function M.disable()
  M.log("Debugging disabled")
  M.DEBUG = false
end

-- View log in a new buffer
function M.view_log()
  -- Open the log file in a new buffer
  vim.cmd("enew")
  vim.cmd("edit " .. M.LOG_FILE)

  -- Set buffer options
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "hide"
  vim.bo.swapfile = false

  -- Optional: Set the filetype to 'log' for syntax highlighting
  vim.bo.filetype = "log"

  -- Optional: Map 'q' to close the buffer
  vim.api.nvim_buf_set_keymap(0, "n", "q", ":bdelete<CR>", { noremap = true, silent = true })

  print("Log file opened in new buffer")
end

-- Clear log file
function M.clear_log()
  local file = io.open(M.LOG_FILE, "w")
  if file then
    file:close()
    print("Log file cleared")
  else
    print("Failed to clear log file")
  end
end

return M

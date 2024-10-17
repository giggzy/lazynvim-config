# Don't execute as still in development
if true then return {} end

local pickers = require("telescope.pickers")
local config = require("telescope.config").values
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")

local M = {}

M.show_docker_images = function(opts)
  pickers
    .new(opts, {
      prompt_title = "Docker Images",
      finder = finders.new_table({
        results = {
          { name = "alpine:latest", value = { 1, 2, 3, 45 } },
          { name = "ubuntu:latest", value = { 1, 2, 3, 45 } },
          { name = "centos:latest", value = { 1, 2, 3, 45 } },
          { name = "debian:latest", value = { 1, 2, 3, 45 } },
          { name = "fedora:latest", value = { 1, 2, 3, 45 } },
        },
        entry_maker = function(entry)
          return {
            value = entry,
            display = entry.name,
            ordinal = entry.name,
          }
        end,
      }),

      sorter = config.generic_sorter(opts),

      previewer = previewers.new_buffer_previewer({
        title = "Docker Image",
        define_preview = function(self, entry)
          vim.api.nvim_buf_set_lines(
            self.state.bufnr,
            0,
            0,
            true,
            vim.tbl_flatten({
              -- "Docker Image: " .. entry.name,
              -- "Tags: ",
              -- "Layers: ",
              "Hello",
              "World",
              vim.split(vim.inspect(entry.value), "\n"),
            })
          )
        end,
        get_buffer_by_name = function(_, entry)
          return entry.name
        end,
      }),
    })
    :find()
end

-- M.show_docker_images()

return M

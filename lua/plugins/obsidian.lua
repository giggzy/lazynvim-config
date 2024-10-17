return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal/",
      },
      {
        name = "work",
        path = "~/vaults/work/",
      },
    },
    -- Specify the path to your template
    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- Define other substitutions
      substitutions = {
        date = function()
          return os.date("%Y-%m-%d")
        end,
        title = function()
          return vim.fn.expand("%:t:r") -- Not sure about this?
        end,
      },
    },
    -- Optional: Configure mappings
    mappings = {
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Add more mappings as needed
    },
    -- Optional: Configure note completion
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    -- Optional: Configure additional Obsidian features
    daily_notes = {
      folder = "dailies",
      date_format = "%Y-%m-%d",
      template = "daily_template.md",
    },
  },
}

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
print("Loading keymaps.lua")

local wk = require("which-key")
wk.add({
  -- { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Focus Filesysem" },
  { "<leader>o", "<cmd>w<cr>", desc = "Save File" },

  --[[
-- Migrate any of these I wna to keep to the new format
  ["<leader>"] = {
    name = "LazyVim",
    o = { "<cmd>w<cr>", "Save" },
    w = { "<cmd>w<cr>", "Save" },
    -- focus on explorer
    r = {
      function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd.wincmd("p")
        else
          vim.cmd.Neotree("focus")
        end
      end,
      "Toggle Explorer Focus",
    },
    f = { "<cmd>Telescope find_files<cr>", "Focus Filesysem" },
  },
  o = { "<cmd>w<cr>", "Save" },
  e = {
    function()
      if vim.bo.filetype == "neo-tree" then
        vim.cmd.wincmd("p")
      else
        vim.cmd.Neotree("focus")
      end
    end,
    "Toggle Explorer Focus -- Gabe defined",
  },
  f = {
    -- use all the defaults
    h = { "<cmd>Telescope harpoon marks<cr>", "harpoon marks" },
    o = { "<cmd>Telescope live_grep search_dirs={'~/Documents/'}<cr>", "search my obsidian docs" },
  },
  g = {
    -- use all the defaults
    name = "git",
    b = { "<cmd>Telescope git_branches<cr>", "git branches" },
    w = {
      name = "git worktree",
      c = { "<cmd>Telescope git_worktree create_git_worktree<cr>", "create" },
      s = { "<cmd>Telescope git_worktree git_worktrees<cr>", "switch" },
      -- vim.keymap.set('n', '<leader>gws', ':Telescope git_worktree git_worktrees<CR>')
    },
  },
  h = {
    name = "harpoon",
    a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "add file" },
    r = { "<cmd>lua require('harpoon.mark').rm_file()<cr>", "remove file" },
    m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "harpoon menu" },
    n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "next file" },
    p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "previous file" },
    ["1"] = { "<cmd> lua require('harpoon.ui').nav_file(1)<cr>", "file 1" },
    ["2"] = { "<cmd> lua require('harpoon.ui').nav_file(2)<cr>", "file 2" },
    ["3"] = { "<cmd> lua require('harpoon.ui').nav_file(3)<cr>", "file 3" },
  },
  H = {
    -- Not sure I want this
    name = "help/debug/conceal",
    c = {
      name = "conceal",
      h = { ":set conceallevel=1<cr>", "hide/conceal" },
      s = { ":set conceallevel=0<cr>", "show/unconceal" },
    },
    t = {
      name = "treesitter",
      t = { vim.treesitter.inspect_tree, "show tree" },
      c = { ":=vim.treesitter.get_captures_at_cursor()<cr>", "show capture" },
      n = { ":=vim.treesitter.get_node():type()<cr>", "show node" },
    },
  },
}, { prefix = "<leader>" }
--]]
})

-- stuff
-- keys = {
--   { "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
--   { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
--   { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Go to previous harpoon mark" },
--   { "<leader>ha", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
-- },
--
print("Loaded keymaps.lua")

return {
  { "nvim-neotest/neotest-plenary" },
  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = { "nvim-neotest/neotest-plenary", "nvim-neotest/neotest-python" },
  --   opts = {
  --     adapters = {
  --       ["neotest-plenary"] = {},
  --       ["neotest-python"] = {
  --         dap = { justMyCode = false },
  --         runner = "pytest",
  --       },
  --     },
  --   },
  -- },
  {
    "nvim-neotest/neotest-python",
  },
  {
    "ThePrimeagen/git-worktree.nvim",
  },
  {
    "otavioschwanck/arrow.nvim",
    opts = {
      show_icons = true,
      leader_key = ";", -- Recommended to be a single key
    },
  },
  {
    "FabijanZulj/blame.nvim",
    config = function()
      require("blame").setup()
    end,
  },
}

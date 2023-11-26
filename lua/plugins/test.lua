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
}

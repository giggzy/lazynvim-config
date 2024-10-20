return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    -- print("none-ls setup started")

    local cfn_lint = null_ls.builtins.diagnostics.cfn_lint.with({
      filetypes = { "yaml", "yaml.cloudformation" },
    })

    local sources = {
      -- null_ls.builtins.formatting.stylua,
      --null_ls.builtins.diagnostics.eslint,
      -- null_ls.builtins.diagnostics.cfn_lint,
      cfn_lint,
    }

    for _, source in ipairs(sources) do
      D("Registering source:", source.name)
    end

    null_ls.setup({
      sources = sources,
      debug = true,
      filetypes = {
        "cloudformation",
      },
    })
    -- print("none-ls setup is complete")
  end,
}

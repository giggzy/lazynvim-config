return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      yamlls = {
        settings = {
          yaml = {
            schemas = {
              ["https://raw.githubusercontent.com/awslabs/goformation/v5.2.9/schema/cloudformation.schema.json"] = "/**/*.cf.{yaml,yml}",
            },
            customTags = {
              "!Ref",
              "!Sub",
              "!ImportValue",
              "!GetAtt",
              "!FindInMap",
              "!Join",
              -- Add other CloudFormation intrinsic functions as needed
            },
          },
        },
        filetypes = { "yaml", "yaml.ansible", "yaml.cloudformation" },
      },
      ruff = {
        init_options = {
          settings = {
            lint = { enabled = true },
          },
        },
        pyright = {
          settings = {
            enable = false,
            -- pyright = {
            --   -- Using Ruff's import organizer
            --   disableOrganizeImports = true,
            -- },
            -- python = {
            --   analysis = {
            -- -- Ignore all files for analysis to exclusively use Ruff for linting
            -- ignore = { "*" },
            --   },
            -- },
          },
        },
        pylsp = {
          settings = {
            plugins = {
              pylint = { enabled = "false" },
              pyflakes = { enabled = "false" },
              pycodestyle = {
                enabled = "false",
                maxLineLength = 100,
              },
            },
          },
        },
      },
    },
  },
  require("lspconfig").ruff.setup({
    init_options = {
      settings = {
        lint = { enabled = true },
      },
    },
  }),
  require("lspconfig").pyright.setup({
    settings = {
      pyright = {
        -- Using Ruff's import organizer
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          -- Ignore all files for analysis to exclusively use Ruff for linting
          ignore = { "*" },
        },
      },
    },
  }),
}

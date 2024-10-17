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
    },
  },
}

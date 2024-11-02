return {
    {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
        if true == false then
            opts.sections = vim.tbl_extend("force", opts.sections, {
                -- Not doing anything interesting yet
                lualine_a = { "mode" },
            })
        else
            -- Use the default configuration
            opts = {}
        end
    end
    }
}

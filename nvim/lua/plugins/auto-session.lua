return {
    "rmagatti/auto-session",
    config = function()
        require("auto-session").setup({
            log_level = "info",
            auto_session_enable_last_session = true,
            auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
            auto_session_enabled = true,
            pre_save_cmds = {"NvimTreeClose"},
            bypass_session_save_file_types = {"NvimTree", "neo-tree"},
            filter_rules = {
                empty = true,
            },
        })
    end,
}

return {
    {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
            local nt = require("neo-tree")

            nt.setup{
                popup_border_style = "rounded",
                enable_git_status = true,
                filesystem = {
                    filtered_items = {
                        visible = true,
                        hide_dotfiles = false,
                        hide_gitignored = true,
                    },
                },
                source_selector = {
                    winbar = true,
                    sources = {
                        { source = 'filesystem' },
                    },
                },
                window = {
                    position = "float", 
                },
                default_component_configs = {
                    git_status = {
                        symbols = {
                            added = "+",
                            modified = "~",
                            deleted = "-",
                            renamed = "r",
                            untracked = "U",
                            ignored = "i",
                            unstaged = "",
                            staged = "S",
                            conflict = "!",
                        },
                    },
                }
            }

            vim.keymap.set("n", "<leader>e", function()
                require("neo-tree.command").execute({ toggle = true })
            end, { desc = "Toggle Neo-tree" }
            )


            vim.cmd([[
                highlight! link NeoTreeFileName Normal
                highlight! link NeoTreeFileIcon Normal
                highlight! link NeoTreeGitAdded Normal
                highlight! link NeoTreeModified Normal
                highlight! link NeoTreeIndentMarker Normal

                highlight NeoTreeGitAdded guifg=#7AA2F7 guibg=NONE gui=NONE
                highlight NeoTreeGitModified guifg=#FF9E64 guibg=NONE gui=NONE
                highlight NeoTreeGitDeleted guifg=#F7768E guibg=NONE gui=NONE
                highlight NeoTreeGitRenamed guifg=#BB9AF7 guibg=NONE gui=NONE

                highlight NeoTreeGitUntracked guifg=#2e7d32 guibg=NONE gui=NONE
                highlight NeoTreeGitIgnored guifg=#565f89 guibg=NONE gui=NONE
                highlight NeoTreeGitStaged guifg=#3b4261 guibg=NONE gui=NONE
                highlight NeoTreeGitConflict guifg=#9B111E guibg=NONE gui=bold
            ]])
        end
    }
}

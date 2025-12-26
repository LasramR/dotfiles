return {
    'saghen/blink.cmp',
    version = "1.*",
    opts = {
        keymap = {
            preset = "default",
        },

        sources = {
            default = {
              "lsp",
              "path",
              "snippets",
              "buffer",
            },
        },

        completion = {
            documentation = {
              auto_show = true,
              auto_show_delay_ms = 200,
            },
        },

        signature = {
            enabled = true,
        },

        fuzzy = {
              implementation = "lua",
        },
    }
}

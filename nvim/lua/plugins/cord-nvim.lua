-- Discord rich presence
return {
    {
        "vyfor/cord.nvim",
        build = ":Cord update",
        opts = {
            enabled = true,
            log_level = vim.log.levels.OFF,

            editor = {
                client = "neovim",
                tooltip = "The Superior Text Editor",
                icon = nil,
            },

            display = {
                theme = "default",
                flavor = "dark",
                view = "full",
                swap_fields = false,
                swap_icons = false,
            },

            timestamp = {
                enabled = true,
                reset_on_idle = false,
                reset_on_change = false,
                shared = false,
            },

            idle = {
                enabled = true,
                timeout = 300000,
                show_status = true,
                ignore_focus = true,
                unidle_on_focus = true,
                smart_idle = true,
                details = "Idling",
                state = nil,
                tooltip = "💤",
                icon = nil,
            },

            text = {
                workspace = nil,
                editing = function(opts)
                    return opts.filename
                end,
            },

            buttons = nil,
            assets = nil,
            variables = nil,

            hooks = {
                ready = nil,
                shutdown = nil,
                pre_activity = nil,
                post_activity = nil,
                idle_enter = nil,
                idle_leave = nil,
                workspace_change = nil,
                buf_enter = nil,
            },

            extensions = nil,

            advanced = {
                plugin = {
                    autocmds = true,
                    cursor_update = "on_hold",
                    match_in_mappings = true,
                    debounce = {
                        delay = 50,
                        interval = 750,
                    },
                },

                server = {
                    update = "fetch",
                    pipe_path = nil,
                    executable_path = nil,
                    timeout = 300000,
                },

                discord = {
                    pipe_paths = nil,
                    reconnect = {
                        enabled = false,
                        interval = 5000,
                        initial = true,
                    },
                    sync = {
                        enabled = true,
                        mode = "periodic",
                        interval = 12000,
                        reset_on_update = true,
                        pad = true,
                    },
                },

                workspace = {
                    root_markers = {
                        ".git",
                        ".hg",
                        ".svn",
                    },
                    limit_to_cwd = false,
                },
            },
        },
    },
}

-- Snacks configuration
return {
  "folke/snacks.nvim",
  opts = {
    scroll = {
      enabled = true,
    },
    dashboard = {
      preset = {
        header = nil, -- Use default LazyVim header
      },
    },
    -- Hide statusline and tabline on dashboard
    -- styles = {
    --   dashboard = {
    --     wo = {
    --       statusline = " ",
    --     },
    --   },
    -- },
  },
}

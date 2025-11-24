-- UI enhancements
return {
  -- Color code highlighter
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {},
  },
  -- Floating terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        direction = "float",
        open_mapping = [[<C-\>]],
        start_in_insert = true,
        float_opts = {
          border = "curved",
          width = 100,
          height = 30,
          winblend = 0,
        },
      })

      vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Terminal horizontal" })
      vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Terminal vertical" })
    end,
  },
  -- Buffer tabs
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          diagnostics = "nvim_lsp",
          separator_style = "slant",
          always_show_bufferline = true,
          show_buffer_close_icons = true,
          show_close_icon = false,
          color_icons = true,
          custom_filter = function(bufnr)
            local ft = vim.bo[bufnr].filetype
            return ft ~= "neo-tree"
          end,
        },
      })

      vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
      vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
    end,
  },
  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          follow_current_file = {
            enabled = false,
          },
          use_libuv_file_watcher = true,
        },
        window = {
          position = "left",
          width = 30,
          mappings = {
            ["<S-CR>"] = "set_root", -- Shift+Enter to jump into directory
          },
        },
      })
      vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree Explorer" })

      local neo_tree_fullscreen_state = {
        was_fullscreen = false,
        previous_winview = nil,
        previous_buf = nil,
      }

      vim.keymap.set("n", "<leader>E", function()
        local state = neo_tree_fullscreen_state

        if not state.was_fullscreen then
          state.previous_buf = vim.api.nvim_get_current_buf()
          state.previous_winview = vim.fn.winsaveview()

          vim.cmd("only")
          vim.cmd("Neotree reveal left")
          vim.cmd("vertical resize " .. vim.o.columns)

          state.was_fullscreen = true
        else
          vim.cmd("bd")
          vim.cmd("enew")

          if state.previous_buf and vim.api.nvim_buf_is_valid(state.previous_buf) then
            vim.cmd("buffer " .. state.previous_buf)
          end

          if state.previous_winview then
            vim.fn.winrestview(state.previous_winview)
          end

          state.was_fullscreen = false
        end
      end, { desc = "Toggle Neo-tree fullscreen" })
    end,
  },
}

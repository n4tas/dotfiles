-- File explorer
return {
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
          ["<M-CR>"] = "set_root", -- Alt+Enter to cd into directory
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
}

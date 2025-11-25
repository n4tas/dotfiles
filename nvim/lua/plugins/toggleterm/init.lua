-- Floating terminal
return {
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
}

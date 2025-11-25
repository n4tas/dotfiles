-- Safe buffer delete
return {
  "nvim-mini/mini.nvim",
  version = "*",
  config = function()
    vim.keymap.set("n", "<leader>bd", function()
      require("mini.bufremove").delete(0, false)
    end, { desc = "[B]uffer [D]elete (safe)" })
  end,
}

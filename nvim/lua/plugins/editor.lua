-- Editor utilities
return {
  -- Save files with sudo
  {
    "lambdalisue/vim-suda",
    lazy = false,
  },
  -- Easy commenting
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup({
        padding = true,
        sticky = true,
        ignore = nil,
        mappings = {
          basic = true,
          extra = true,
          extended = false,
        },
        pre_hook = nil,
        post_hook = nil,
      })
    end,
  },
  -- Auto-close brackets and quotes
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
    end,
  },
  -- Safe buffer delete
  {
    "nvim-mini/mini.nvim",
    version = "*",
    config = function()
      vim.keymap.set("n", "<leader>bd", function()
        require("mini.bufremove").delete(0, false)
      end, { desc = "[B]uffer [D]elete (safe)" })
    end,
  },
}

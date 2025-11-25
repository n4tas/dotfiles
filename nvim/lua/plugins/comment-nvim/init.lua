-- Easy commenting
return {
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
}

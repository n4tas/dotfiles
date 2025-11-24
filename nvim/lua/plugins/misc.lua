-- Miscellaneous tools
return {
  -- Detect tabstop and shiftwidth automatically
  {
    "tpope/vim-sleuth",
    lazy = false,
  },
  -- Discord rich presence
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
  },
  -- Image support in Neovim
  {
    "3rd/image.nvim",
    build = false,
    opts = {
      processor = "magick_cli",
    },
  },
}

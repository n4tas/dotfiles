-- Image support in Neovim
return {
  "3rd/image.nvim",
  build = false,
  opts = {
    processor = "magick_cli",
  },
}

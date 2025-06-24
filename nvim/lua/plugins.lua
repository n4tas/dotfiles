local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  { "rose-pine/neovim", name = "rose-pine" },
  "windwp/nvim-autopairs",
  "norcalli/nvim-colorizer.lua",
  "numToStr/Comment.nvim",
  "kyazdani42/nvim-web-devicons",
  "f-person/git-blame.nvim",
  "kdheepak/lazygit.nvim",
  "nvim-lualine/lualine.nvim",
  "karb94/neoscroll.nvim",
  "nvim-neo-tree/neo-tree.nvim",
  "nvim-telescope/telescope.nvim",
  "goolord/alpha-nvim",
  "wakatime/vim-wakatime",
  "MunifTanjim/nui.nvim",
  "morhetz/gruvbox",
  -- Completion / LSP / Syntax / Formatting
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "jose-elias-alvarez/null-ls.nvim",
  "nvim-treesitter/nvim-treesitter",
  {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
  end,
  },
  {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup {
      direction = "horizontal",
      size = 15,
      open_mapping = [[<C-t>]],
    }
   end,
  },
})


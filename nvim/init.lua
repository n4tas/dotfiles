require("plugins")

vim.o.termguicolors = true
vim.cmd("colorscheme rose-pine")

-- Editor settings
vim.o.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.number = true
vim.o.hidden = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.cursorline = true
vim.o.scrolloff = 8
vim.o.termguicolors = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.swapfile = false

vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.cmd("colorscheme gruvbox")
vim.o.background = "dark"
vim.o.clipboard = "unnamedplus"

-- Autopairs
require("nvim-autopairs").setup()

-- Colorizer
require("colorizer").setup()

-- Comment
require("Comment").setup()

-- Neoscroll
require("neoscroll").setup()

-- Neotree
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
require("neo-tree").setup()

-- Telescope
require("telescope").setup{}

-- Lualine
require("lualine").setup {
  options = { theme = "rose-pine" }
}

-- Alpha Dashboard
require("alpha").setup(require("alpha.themes.startify").config)


vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<leader>to", ":tabonly<CR>")
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>")
vim.keymap.set("n", "<leader>tj", ":tabnext<CR>")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "jsx", "tsx", "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "css", "lua" },
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
  end,
})


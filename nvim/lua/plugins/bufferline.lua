-- Buffer tabs
return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        always_show_bufferline = false,
        show_buffer_close_icons = true,
        show_close_icon = false,
        color_icons = true,
        custom_filter = function(bufnr)
          local ft = vim.bo[bufnr].filetype
          return ft ~= "neo-tree" and ft ~= "snacks_dashboard"
        end,
      },
    })

    -- Auto-hide bufferline on dashboard
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "snacks_dashboard",
      callback = function()
        vim.opt_local.laststatus = 0
        vim.opt_local.showtabline = 0
      end,
    })

    vim.api.nvim_create_autocmd("BufLeave", {
      pattern = "*",
      callback = function()
        if vim.bo.filetype == "snacks_dashboard" then
          vim.opt.laststatus = 3
          vim.opt.showtabline = 2
        end
      end,
    })

    vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
    vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
  end,
}

-- Flutter development tools
return {
  {
    "akinsho/flutter-tools.nvim",
    ft = { "dart" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
      "stevearc/dressing.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("flutter-tools").setup({
        ui = {
          border = "rounded",
          notification_style = "native",
        },
        decorations = {
          statusline = {
            app_version = false,
            device = false,
            project_config = false,
          },
        },
        debugger = {
          enabled = false,
          exception_breakpoints = {},
          evaluate_to_string_in_debug_views = true,
        },
        flutter_path = "/home/natis/work/libs/flutter/bin/flutter",
        root_patterns = { ".git", "pubspec.yaml" },
        fvm = false,
        default_run_args = nil,
        widget_guides = {
          enabled = false,
        },
        closing_tags = {
          highlight = "ErrorMsg",
          prefix = ">",
          priority = 10,
          enabled = true,
        },
        dev_log = {
          enabled = true,
          filter = nil,
          notify_errors = false,
          open_cmd = "15split",
          focus_on_open = true,
        },
        dev_tools = {
          autostart = false,
          auto_open_browser = false,
        },
        outline = {
          open_cmd = "30vnew",
          auto_open = false,
        },
        lsp = {
          color = {
            enabled = false,
            background = false,
            background_color = nil,
            foreground = false,
            virtual_text = true,
            virtual_text_str = "■",
          },
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            analysisExcludedFolders = { "<path-to-flutter-sdk-packages>" },
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
            updateImportsOnRename = true,
          },
        },
      })
    end,
  },
}

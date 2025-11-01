--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Make line numbers default
vim.o.number = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

vim.o.confirm = true

--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.api.nvim_set_keymap("v", "x", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
-- vim.keymap.set("n", "<leader>tt", ":terminal<CR>", { desc = "Open terminal in buffer" })
-- vim.keymap.set("n", "<leader>tv", ":vsplit | terminal<CR>", { desc = "Terminal (vertical split)" })
-- vim.keymap.set("n", "<leader>ts", ":split | terminal<CR>", { desc = "Terminal (horizontal split)" })
local move_opts = { noremap = true, silent = true, desc = "Movement remap" }

vim.keymap.set("n", "j", "h", move_opts) -- left
vim.keymap.set("n", "k", "j", move_opts) -- down
vim.keymap.set("n", "l", "k", move_opts) -- up
vim.keymap.set("n", ";", "l", move_opts) -- right

vim.keymap.set("v", "j", "h", move_opts)
vim.keymap.set("v", "k", "j", move_opts)
vim.keymap.set("v", "l", "k", move_opts)
vim.keymap.set("v", ";", "l", move_opts)

vim.keymap.set("o", "j", "h", move_opts)
vim.keymap.set("o", "k", "j", move_opts)
vim.keymap.set("o", "l", "k", move_opts)
vim.keymap.set("o", ";", "l", move_opts)
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>tt", ":terminal<CR>", { desc = "Open terminal in buffer" })

vim.keymap.set("n", "<C-j>", "<C-w>h", { noremap = true, silent = true, desc = "Move focus to left window" })
vim.keymap.set("n", "<C-;>", "<C-w>l", { noremap = true, silent = true, desc = "Move focus to right window" })
vim.keymap.set("n", "<C-k>", "<C-w>j", { noremap = true, silent = true, desc = "Move focus to lower window" })
vim.keymap.set("n", "<C-l>", "<C-w>k", { noremap = true, silent = true, desc = "Move focus to upper window" })
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.bo.expandtab = true -- Use spaces instead of tabs
		vim.bo.shiftwidth = 4 -- Indent by 4 spaces
		vim.bo.tabstop = 4 -- Tab key inserts 4 spaces
		vim.bo.softtabstop = 4 -- Backspace deletes 4 spaces
		vim.bo.textwidth = 88 -- PEP 8 recommends 79–88 cols
		vim.bo.autoindent = true -- Copy indent from current line
		vim.bo.smartindent = true -- Smart indentation for blocks
		vim.bo.commentstring = "# %s" -- Python comment style
	end,
	desc = "Set Python indentation (PEP8: 4 spaces)",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp", "h", "hpp" },
	callback = function()
		vim.bo.expandtab = false -- Use hard tabs (common in C/C++)
		vim.bo.tabstop = 4 -- Tabs are 4 spaces wide
		vim.bo.softtabstop = 4 -- Backspace deletes 1 tab = 4 spaces
		vim.bo.cindent = true -- Enable C-style indentation
		vim.bo.textwidth = 100 -- Wrap lines at 100 columns (optional)
		vim.bo.shiftwidth = 4 -- Indent width of 4 spaces
		vim.bo.commentstring = "// %s"
	end,
	desc = "Set C/C++ indentation to 4-space tabs",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "dart",
	callback = function()
		vim.bo.expandtab = true -- Use spaces instead of tabs
		vim.bo.shiftwidth = 2 -- Indent by 2 spaces
		vim.bo.tabstop = 2 -- A tab counts for 2 spaces
		vim.bo.softtabstop = 2 -- Backspace deletes 2 spaces
		vim.bo.textwidth = 80 -- Optional: wrap at 80 cols
	end,
	desc = "Set Dart indentation to 2 spaces",
})

vim.opt.autochdir = false

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes

-- Resize current window width
vim.keymap.set("n", "<leader>-", ":vertical resize -10<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<leader>=", ":vertical resize +10<CR>", { desc = "Increase window width" })
vim.keymap.set("n", "<leader><Up>", ":resize -10<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<leader><Down>", ":resize +10<CR>", { desc = "Increase window height" })
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "gruvbox",
	callback = function()
		require("gruvbox").setup({
			transparent_mode = true,
			contrast = "soft",
			overrides = {
				SignColumn = { bg = "NONE" },
				Normal = { bg = "NONE" },
				NormalNC = { bg = "NONE" },
				NormalFloat = { bg = "NONE" },
				FloatBorder = { bg = "NONE" },
				VertSplit = { bg = "NONE" },
				StatusLine = { bg = "NONE" },
				StatusLineNC = { bg = "NONE" },
				LineNr = { bg = "NONE" },
				EndOfBuffer = { bg = "NONE" },
			},
		})
	end,
})
-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- Toggle Avante window with <Space>r
require("lazy").setup({

	{
		"tpope/vim-sleuth",
		lazy = false, -- load on startup
	},
	{ "lambdalisue/vim-suda", lazy = false },
	{
		"tpope/vim-dadbod",
		lazy = false,
	},
	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		config = true,
		keys = {
			{ "<leader>a", nil, desc = "AI/Claude Code" },
			{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
			{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
			{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
			{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
			{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
			{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
			{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
			{
				"<leader>as",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file",
				ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
			},
			-- Diff management
			{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
		},
	},
	{ "kristijanhusak/vim-dadbod-completion", lazy = false },
	{
		"EdenEast/nightfox.nvim",
		lazy = false, -- load immediately
		priority = 1000, -- make sure it loads before everything else
		config = function()
			require("nightfox").setup({
				options = {
					transparent = true, -- if you want transparent background
					terminal_colors = true,
					styles = {
						comments = "italic",
						keywords = "bold",
						functions = "italic,bold",
						types = "italic,bold",
					},
				},
				palettes = {}, -- you can override specific colors if you want
				specs = {}, -- fine-tune highlight groups
				groups = {}, -- extra highlight groups
			})

			-- Set colorscheme
			vim.cmd("colorscheme carbonfox")
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("github-theme").setup({})
			vim.cmd("colorscheme github_dark_high_contrast")
		end,
	},
	{
		"navarasu/onedark.nvim",
		lazy = false, -- load immediately
		priority = 1000, -- make sure it loads before other plugins
		config = function()
			require("onedark").setup({
				style = "darker", -- options: dark, darker, cool, deep, warm, warmer, light
			})
		end,
	},
	{
		"akinsho/flutter-tools.nvim",
		ft = { "dart" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig", -- ensure lspconfig is present
			"stevearc/dressing.nvim", -- optional
			"mfussenegger/nvim-dap", -- optional, for debugging
		},
		config = function()
			require("flutter-tools").setup({
				ui = {
					-- the border type to use for all floating windows, the same options/formats
					-- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
					border = "rounded",
					-- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
					-- please note that this option is eventually going to be deprecated and users will need to
					-- depend on plugins like `nvim-notify` instead.
					notification_style = "native",
				},
				decorations = {
					statusline = {
						-- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
						-- this will show the current version of the flutter app from the pubspec.yaml file
						app_version = false,
						-- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
						-- this will show the currently running device if an application was started with a specific
						-- device
						device = false,
						-- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
						-- this will show the currently selected project configuration
						project_config = false,
					},
				},
				debugger = { -- integrate with nvim dap + install dart code debugger
					enabled = false,
					-- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
					-- see |:help dap.set_exception_breakpoints()| for more info
					exception_breakpoints = {},
					-- Whether to call toString() on objects in debug views like hovers and the
					-- variables list.
					-- Invoking toString() has a performance cost and may introduce side-effects,
					-- although users may expected this functionality. null is treated like false.
					evaluate_to_string_in_debug_views = true,
					-- You can use the `debugger.register_configurations` to register custom runner configuration (for example for different targets or flavor). Plugin automatically registers the default configuration, but you can override it or add new ones.
					-- register_configurations = function(paths)
					--   require("dap").configurations.dart = {
					--     -- your custom configuration
					--   }
					-- end,
				},
				flutter_path = "/home/natis/work/libs/flutter/bin/flutter",
				root_patterns = { ".git", "pubspec.yaml" }, -- patterns to find the root of your flutter project
				fvm = false, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
				default_run_args = nil, -- Default options for run command (i.e `{ flutter = "--no-version-check" }`). Configured separately for `dart run` and `flutter run`.
				widget_guides = {
					enabled = false,
				},
				closing_tags = {
					highlight = "ErrorMsg", -- highlight for the closing tag
					prefix = ">", -- character to use for close tag e.g. > Widget
					priority = 10, -- priority of virtual text in current line
					-- consider to configure this when there is a possibility of multiple virtual text items in one line
					-- see `priority` option in |:help nvim_buf_set_extmark| for more info
					enabled = true, -- set to false to disable
				},
				dev_log = {
					enabled = true,
					filter = nil, -- optional callback to filter the log
					-- takes a log_line as string argument; returns a boolean or nil;
					-- the log_line is only added to the output if the function returns true
					notify_errors = false, -- if there is an error whilst running then notify the user
					open_cmd = "15split", -- command to use to open the log buffer
					focus_on_open = true, -- focus on the newly opened log window
				},
				dev_tools = {
					autostart = false, -- autostart devtools server if not detected
					auto_open_browser = false, -- Automatically opens devtools in the browser
				},
				outline = {
					open_cmd = "30vnew", -- command to use to open the outline buffer
					auto_open = false, -- if true this will open the outline automatically when it is first populated
				},
				lsp = {
					color = { -- show the derived colours for dart variables
						enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
						background = false, -- highlight the background
						background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
						foreground = false, -- highlight the foreground
						virtual_text = true, -- show the highlight using virtual text
						virtual_text_str = "■", -- the virtual text character to highlight
					},
					-- see the link below for details on each option:
					-- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
					settings = {
						showTodos = true,
						completeFunctionCalls = true,
						analysisExcludedFolders = { "<path-to-flutter-sdk-packages>" },
						renameFilesWithClasses = "prompt", -- "always"
						enableSnippets = true,
						updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
					},
				},
			})
		end,
	},

	{
		"3rd/image.nvim",
		build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
		opts = {
			processor = "magick_cli",
		},
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				transparent_mode = true, -- enable transparency
				contrast = "soft", -- options: "soft", "medium", "hard"
				overrides = {
					SignColumn = { bg = "NONE" },
					Normal = { bg = "NONE" },
					NormalNC = { bg = "NONE" },
					NormalFloat = { bg = "NONE" },
					FloatBorder = { bg = "NONE" },
					VertSplit = { bg = "NONE" },
					StatusLine = { bg = "NONE" },
					StatusLineNC = { bg = "NONE" },
					LineNr = { bg = "NONE" },
					EndOfBuffer = { bg = "NONE" },
				},
			})
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				direction = "float", -- opens terminal as floating window
				open_mapping = [[<C-\>]], -- toggle terminal with Ctrl + \
				start_in_insert = true, -- always start in insert mode
				float_opts = {
					border = "curved", -- other options: single, double, shadow
					width = 100,
					height = 30,
					winblend = 0,
				},
			})

			vim.keymap.set(
				"n",
				"<leader>th",
				"<cmd>ToggleTerm direction=horizontal<CR>",
				{ desc = "Terminal horizontal" }
			)
			vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Terminal vertical" })
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers", -- show buffer tabs (alternative: "tabs")
					diagnostics = "nvim_lsp", -- show LSP errors/warnings
					separator_style = "slant", -- or "thick", "thin", "padded_slant"
					always_show_bufferline = true,
					show_buffer_close_icons = true,
					show_close_icon = false,
					color_icons = true,
					custom_filter = function(bufnr)
						local ft = vim.bo[bufnr].filetype
						return ft ~= "neo-tree"
					end,
				},
			})

			-- Keymaps for switching buffers
			vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
			vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
		end,
	},
	{
		"echasnovski/mini.bufremove",
		version = "*",
		config = function()
			vim.keymap.set("n", "<leader>bd", function()
				require("mini.bufremove").delete(0, false)
			end, { desc = "[B]uffer [D]elete (safe)" })
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("Comment").setup({
				-- Add a space between comment and the line
				padding = true,

				-- Whether the cursor should stay in place
				sticky = true,

				-- Lines to ignore when (un)commenting
				ignore = nil,

				-- Enable keybindings
				mappings = {
					basic = true, -- `gcc`, `gbc`
					extra = true, -- `gco`, `gcO`, `gcA`
					extended = false, -- `g>`, `g<` for block selection (optional)
				},

				-- Pre-hook for integrating with ts-context-commentstring or other custom logic
				pre_hook = nil,
				post_hook = nil,
			})
		end,
	},
	{
		"folke/snacks.nvim",
		event = "VeryLazy",
		opts = {
			statuscolumn = {
				enabled = true,
				-- Customize each part of the statuscolumn
				segments = {
					{ text = { "%s" }, click = "SnacksSign" }, -- signs (e.g. git, diagnostics)
					{ text = { "%C" }, click = "SnacksFold" }, -- fold column
					{ text = { " %l" }, click = "SnacksLineNr" }, -- line number
				},
				-- Optional: override default behavior
				setopt = true, -- automatically set 'statuscolumn'
			},
			dashboard = {},
			scroll = {},
		},
	},
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit" },
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			check_ts = true, -- enable Treesitter integration
		},
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)

			-- integrate with blink.cmp (autocompletion confirm = auto pair close)
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- optional but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				filesystem = {
					follow_current_file = {
						enabled = false, -- ⛔ No auto-root-following
					},
					use_libuv_file_watcher = true,
				},
				window = {
					position = "left",
					width = 30,
					mappings = {
						-- 🔥 your custom keybind to jump to the selected folder
						--  mappings = {
						["j"] = "close_node", -- left / collapse
						["k"] = "noop", -- move down
						["l"] = "noop", -- move up
						[";"] = "noop", -- right / expand

						["<CR>"] = "open", -- keep Enter for open
						["h"] = "noop",
						["J"] = "noop",
						["K"] = "noop",
						["L"] = "noop",

						["<S-CR>"] = "set_root", -- Use any key you want here
					},
				},
			})
			vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree Explorer" })
			local neo_tree_fullscreen_state = {
				was_fullscreen = false,
				previous_winview = nil,
				previous_buf = nil,
			}

			vim.keymap.set("n", "<leader>E", function()
				local winid = vim.fn.bufwinid("neo-tree filesystem [1]")
				local state = neo_tree_fullscreen_state

				if not state.was_fullscreen then
					-- Save current buffer + view
					state.previous_buf = vim.api.nvim_get_current_buf()
					state.previous_winview = vim.fn.winsaveview()

					-- Close other windows and open Neo-tree fullscreen
					vim.cmd("only")
					vim.cmd("Neotree reveal left")
					vim.cmd("vertical resize " .. vim.o.columns)

					state.was_fullscreen = true
				else
					-- Restore previous buffer and layout
					vim.cmd("bd") -- close Neo-tree
					vim.cmd("enew") -- open new empty buffer to avoid error if previous closed

					if state.previous_buf and vim.api.nvim_buf_is_valid(state.previous_buf) then
						vim.cmd("buffer " .. state.previous_buf)
					end

					if state.previous_winview then
						vim.fn.winrestview(state.previous_winview)
					end

					state.was_fullscreen = false
				end
			end, { desc = "Toggle Neo-tree fullscreen" })
		end,
	},
	--
	{
		"vyfor/cord.nvim",
		build = ":Cord update",
		-- opts = {}
	},
	-- See `:help gitsigns` to understand what the configuration keys do
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		opts = {
			-- delay between pressing a key and opening which-key (milliseconds)
			-- this setting is independent of vim.o.timeoutlen
			delay = 0,
			icons = {
				-- set icon mappings to true if you have a Nerd Font
				mappings = vim.g.have_nerd_font,
				-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
				-- default which-key.nvim defined Nerd Font icons, otherwise define a string table
				keys = vim.g.have_nerd_font and {} or {
					Up = "<Up> ",
					Down = "<Down> ",
					Left = "<Left> ",
					Right = "<Right> ",
					C = "<C-…> ",
					M = "<M-…> ",
					D = "<D-…> ",
					S = "<S-…> ",
					CR = "<CR> ",
					Esc = "<Esc> ",
					ScrollWheelDown = "<ScrollWheelDown> ",
					ScrollWheelUp = "<ScrollWheelUp> ",
					NL = "<NL> ",
					BS = "<BS> ",
					Space = "<Space> ",
					Tab = "<Tab> ",
					F1 = "<F1>",
					F2 = "<F2>",
					F3 = "<F3>",
					F4 = "<F4>",
					F5 = "<F5>",
					F6 = "<F6>",
					F7 = "<F7>",
					F8 = "<F8>",
					F9 = "<F9>",
					F10 = "<F10>",
					F11 = "<F11>",
					F12 = "<F12>",
				},
			},

			-- Document existing key chains
			spec = {
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>t", group = "[T]oggle" },
				{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
			},
		},
	},
	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions
				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				build = "make",

				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			-- Useful for getting pretty icons, but requires a Nerd Font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			-- It's also possible to pass additional configuration options.
			--  See `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			-- Shortcut for searching your Neovim configuration files
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},

	-- LSP Plugins
	{
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		-- Main LSP Configuration
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			-- Mason must be loaded before its dependents so we need to set it up here.
			-- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updates for LSP.
			{ "j-hui/fidget.nvim", opts = {} },

			-- Allows extra capabilities provided by blink.cmp
			"saghen/blink.cmp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					-- NOTE: Remember that Lua is a real programming language, and as such it is possible
					-- to define small helper and utility functions so you don't have to repeat yourself.
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("grn", vim.lsp.buf.rename, "[R]e[n]ame")

					map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })

					map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

					map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

					map("grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

					map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")

					map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")

					map("grt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")

					---@param client vim.lsp.Client
					---@param method vim.lsp.protocol.Method
					---@param bufnr? integer some lsp support methods only in specific files
					---@return boolean
					local function client_supports_method(client, method, bufnr)
						if vim.fn.has("nvim-0.11") == 1 then
							return client:supports_method(method, bufnr)
						else
							return client.supports_method(method, { bufnr = bufnr })
						end
					end

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if
						client
						and client_supports_method(
							client,
							vim.lsp.protocol.Methods.textDocument_documentHighlight,
							event.buf
						)
					then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					-- The following code creates a keymap to toggle inlay hints in your
					-- code, if the language server you are using supports them
					--
					-- This may be unwanted, since they displace some of your code
					if
						client
						and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
					then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			-- Diagnostic Config
			-- See :help vim.diagnostic.Opts
			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				} or {},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
			})

			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local servers = {
				-- clangd = {},
				-- gopls = {},
				-- pyright = {},
				-- rust_analyzer = {},
				-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
				--
				-- Some languages (like typescript) have entire language plugins that can be useful:
				--    https://github.com/pmizio/typescript-tools.nvim
				--
				-- But for many setups, the LSP (`ts_ls`) will work just fine
				-- ts_ls = {},
				--

				lua_ls = {
					-- filetypes = { ... },
					-- capabilities = {},
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							-- diagnostics = { disable = { 'missing-fields' } },
						},
					},
				},
			}
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
			require("mason-lspconfig").setup({
				ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
				automatic_installation = false,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},

	{ -- Autoformat
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				if disable_filetypes[vim.bo[bufnr].filetype] then
					return nil
				else
					return {
						timeout_ms = 500,
						lsp_format = "fallback",
					}
				end
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
			},
		},
	},

	{ -- Autocompletion
		"saghen/blink.cmp",
		event = "VimEnter",
		version = "1.*",
		dependencies = {
			-- Snippet Engine
			{
				"L3MON4D3/LuaSnip",
				version = "2.*",
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {},
				opts = {},
			},
			"folke/lazydev.nvim",
		},
		--- @module 'blink.cmp'
		--- @type blink.cmp.Config
		opts = {
			keymap = {
				preset = "default",
			},
			appearance = {
				nerd_font_variant = "mono",
			},

			completion = {
				documentation = { auto_show = false, auto_show_delay_ms = 500 },
			},

			sources = {
				default = { "lsp", "path", "snippets", "lazydev" },
				providers = {
					lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
				},
			},
			snippets = { preset = "luasnip" },
			fuzzy = { implementation = "lua" },
			signature = { enabled = true },
		},
	},

	{ -- You can easily change to a different colorscheme.
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("tokyonight").setup({
				styles = {
					comments = { italic = false }, -- Disable italics in comments
				},
			})
			vim.cmd([[
			      hi Normal guibg=NONE ctermbg=NONE
			      hi NormalNC guibg=NONE ctermbg=NONE
			      hi EndOfBuffer guibg=NONE ctermbg=NONE
			      hi NeoTreeNormal guibg=NONE ctermbg=NONE
			      hi StatusLine guibg=NONE ctermbg=NONE
			      hi StatusLineNC guibg=NONE ctermbg=NONE
		    ]])
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup()
			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })
			vim.cmd([[
        hi StatusLine guibg=NONE ctermbg=NONE
        hi StatusLineNC guibg=NONE ctermbg=NONE
      ]])
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
	},
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
vim.g.transparent = true

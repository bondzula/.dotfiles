local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

which_key.setup({
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
})

local normalLeaderOptions = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local normalLeaderMappings = {
	b = {
		name = "Buffer",
		q = { "<cmd>Bdelete<cr>", "Close Buffer" },
		o = { "<cmd>%bd|e#|bd#<cr>", "Close Other Buffers" },
		s = { "<cmd>w<cr>", "Save Buffer" },
		n = { "<cmd>bnext<cr>", "Next Buffer" },
		p = { "<cmd>bprevious<cr>", "Previous Buffer" },
	},

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	g = {
		name = "Git",
		g = { "<cmd>Neogit<cr>", "Neogit" },

		-- Stage changes
		s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
		S = { "<cmd>Gitsigns stage_buffer<cr>", "Stage Hunk" },

		-- Undo stage
		u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Staged Hunk" },

		-- Reset changes
		r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
		R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },

		-- Diff
		d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },

		-- MISC
		l = { "<cmd>Gitsigns blame_line<cr>", "Blame" },
		p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },

		-- Telescope
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
	},

	l = {
		name = "LSP",

		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    h = { "<cmd>lua vim.diagnostics.hide()<cr>", "Hide Diagnostics" },
	},

	s = {
		name = "Search",

    p = { "<cmd>Telescope projects projects<cr>", "Find Project" },

    f = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find in File"},
    F = { "<cmd>Telescope live_grep_raw live_grep_raw<cr>", "Find in Files" },

    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Find File Symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Find Workspace Symbols" },
	},

	t = {
		name = "Toggle",
		-- Trouble (Show diagnostics)
		d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
		D = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },

		t = { "<cmd>ToggleTerm size=20 direction=horizontal<cr>", "Terminal" },
    T = { "<cmd>Twilight<cr>", "Twilight" },
		n = { "<cmd>set invnumber<cr>", "Line Numbers" },
		s = { "<cmd>set invspell<cr>", "Spelling" },
    S = { "<cmd>SymbolsOutline<cr>", "Buffer Symbols"},
		i = { "<cmd>IndentBlanklineToggle<cr>", "Indent Lines" },
		e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	},

	h = {
		a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add File" },
		m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Menu" },

		-- Navigation
		q = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "1st Mark" },
		w = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "2nd Mark" },
		e = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "3rd Mark" },
		r = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "4th Mark" },

		n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next Mark" },
		p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Previous Mark" },
	},
}

which_key.register(normalLeaderMappings, normalLeaderOptions)

local visualLeaderOptions = {
	mode = "v", -- Visual mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local visualLeaderMappings = {
	g = {
		name = "Git",

		-- Stage
      s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
	},

  l = {
    name = "LSP",

      -- f = { "<cmd>lua vim.lsp.buf.ran"}
  }
}

which_key.register(visualLeaderMappings, visualLeaderOptions)

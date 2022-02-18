local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	return
end

gitsigns.setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = {
			hl = "GitSignsChange",
			text = "▎",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter_opts = {
		relative_time = false,
	},
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},

  on_attach = function(bufnr)
    -- Navigation
    vim.keymap.set("n", "]g", "<cmd>Gitsigns next_hunk<cr>", { buffer = bufnr })
    vim.keymap.set("n", "[g", "<cmd>Gitsigns previous_hunk<cr>", { buffer = bufnr })

    -- Actions
    vim.keymap.set("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", { buffer = bufnr })
    vim.keymap.set("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", { buffer = bufnr })
    vim.keymap.set("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", { buffer = bufnr })
    vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { buffer = bufnr })
    vim.keymap.set("n", "<leader>gB", "<cmd>Gitsigns toggle_current_line_blame<cr>", { buffer = bufnr })
    vim.keymap.set("n", "<leader>gk", "<cmd>Gitsigns preview_hunk<cr>", { buffer = bufnr })
    vim.keymap.set({ "n", "v" }, "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", { buffer = bufnr })
    vim.keymap.set({ "n", "v" }, "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", { buffer = bufnr })

    -- Text objects
    vim.keymap.set({ "o", "x" }, "ih", "<cmd>Gitsigns select_hunk<cr>", { buffer = bufnr })
    vim.keymap.set({ "o", "x" }, "ah", "<cmd>Gitsigns select_hunk<cr>", { buffer = bufnr })
  end
})

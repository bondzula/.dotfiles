local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Save buffer (:up only saves the buffer if there are changes)
keymap("n", "<C-s>", "<cmd>up<cr>", opts)

-- Navigate buffers
keymap("n", "]b", "<cmd>bnext<cr>", opts)
keymap("n", "[b", "<cmd>bprevious<cr>", opts)

-- Toggle quick-fix list
keymap("n", "<C-q>", "<cmd>TroubleToggle quickfix<cr>", opts)

-- Navigate quick-fix list
keymap("n", "]q", "<cmd>cnext<cr>", opts)
keymap("n", "[q", "<cmd>cprev<cr>", opts)

-- -- Toggle quick-fix list
-- keymap("n", "<M-l>", "<cmd>lopen<cr>", opts)
--
-- -- Navigate local list
-- keymap("n", "]r", "<cmd>lnext<cr>", opts)
-- keymap("n", "[r", "<cmd>lprev<cr>", opts)

-- Navigate buffer errors
keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)

-- Show diagnostics under cursor
keymap("n", "gh", "<cmd>vim.diagnostic.open_float()<cr>", opts);

-- Find files
keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

function format_range_operator()
  local old_func = vim.go.operatorfunc
  _G.op_func_formatting = function()
    local start = vim.api.nvim_buf_get_mark(0, '[')
    local finish = vim.api.nvim_buf_get_mark(0, ']')
    vim.lsp.buf.range_formatting({}, start, finish)
    vim.go.operatorfunc = old_func
    _G.op_func_formatting = nil
  end
  vim.go.operatorfunc = 'v:lua.op_func_formatting'
  vim.api.nvim_feedkeys('g@', 'n', false)
end
vim.api.nvim_set_keymap("n", "gm", "<cmd>lua format_range_operator()<CR>", {noremap = true})

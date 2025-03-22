-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "<A-s>", "<CMD>setlocal spell!<CR>", { desc = "Toggle Spell" })

-- source file
vim.keymap.set("n", "<space>xf", "<cmd>source %<CR>", { desc = "source file" })

vim.keymap.set("n", "x", '"_x')

-- Increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

vim.keymap.set("n", "gh", "^", { desc = "Go to the beginning of the line" })
vim.keymap.set("n", "gl", "$", { desc = "go to the end of the line" })
vim.keymap.set("v", "gh", "^", { desc = "Go to the beginning of the line in visual mode" })
vim.keymap.set("v", "gl", "$", { desc = "Go to the end of the line in visual mode" })

-- Windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<Up>", ":resize -2<CR>", { desc = "Resize vertical" })
vim.keymap.set("n", "<Down>", ":resize +2<CR>", { desc = "Resize vertical" })
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", { desc = "Resize horizontally" })
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", { desc = "Resize horizontally" })

-- keep selection after indent/dedent
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- center after search and jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Buffers
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "[N]ext" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "[P]revious" })
vim.keymap.set("n", "<leader>bd", ":bdelete!<CR>", { desc = "[D]elete" }) -- close buffer
vim.keymap.set("n", "<leader>bb", "<cmd> enew <CR>", { desc = "[N]ew Buffer" }) -- new buffer

-- obsidian
--
vim.keymap.set("n", "<leader>oo", ":cd /home/malthor/Sync/obsidian/second-brain<cr>")
vim.keymap.set("n", "<leader>on", ":ObsidianNew ")
-- convert note to template and remove leading white space
vim.keymap.set("n", "<leader>ot", ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")
-- strip date from note title and replace dashes with spaces
-- must have cursor on title
vim.keymap.set("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>")
-- search for files in full vault
vim.keymap.set("n", "<leader>os", ':Telescope find_files search_dirs={"/home/malthor/Sync/obsidian/second-brain"}<cr>')
vim.keymap.set("n", "<leader>oz", ':Telescope live_grep search_dirs={"/home/malthor/Sync/obsidian/second-brain"}<cr>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
end)

-- vim: ts=2 sts=2 sw=2 et

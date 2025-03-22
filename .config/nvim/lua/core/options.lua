--  For more options, you can see `:help option-list`

vim.g.have_nerd_font = true

local config = vim.fn.stdpath "config"

vim.opt.conceallevel = 2 -- for obsidian plugin

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false -- Don't show the mode, since it's already in the status line
vim.opt.undofile = true -- Enable persistend undo
vim.opt.swapfile = false
vim.opt.shadafile = "NONE" -- Don't save history
vim.opt.gdefault = true -- Replace all line matches during substitution
vim.opt.inccommand = "split" -- Preview substitutions live, as you type!
vim.opt.scrolloff = 4 -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.timeoutlen = 400 -- until which-key pops up
vim.opt.updatetime = 250 -- for autocommands and hovers
vim.opt.tabclose = "left" -- When closing a tab, go to the one on the left
vim.opt.title = true -- Title for the Neovim Window
vim.opt.fillchars = [[eob: ,fold: ,foldopen:󰅀,foldsep: ,foldclose:󰅂]] -- Fancy fold symbols
vim.opt.signcolumn = "yes:1" -- consistent number column
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Softwrap
vim.opt.wrap = false -- Disable softwrap by default
vim.opt.linebreak = true -- Wrap words, not chars
vim.opt.breakindent = true -- Indent softwrapped lines
vim.opt.showbreak = " " -- Wrap indicator

-- Completion
vim.opt.completeopt = "menuone,noselect,noinsert,fuzzy" -- More intuitive completion options
vim.opt.pumheight = 10 -- Limit completion window up to 10 lines
vim.opt.wildoptions = "pum,tagfile,fuzzy" -- Enable fuzzy finding commands

-- Cursor

vim.opt.cursorlineopt = "number" -- Highlight only line number
vim.opt.cursorline = true -- Highlight current line

-- Spell

vim.opt.spellfile = config .. "/spell/en.utf-8.add," .. config .. "/spell/de_de.utf-8.add" -- Custom dictionary files
vim.opt.spelllang = "en,de_de" -- Languages to spell check
vim.opt.spelloptions = "camel" -- Consider camelCase when checking spell
vim.opt.spellsuggest = "best,9" -- Limit the number of suggestions for spell

-- Folds
vim.opt.foldtext = "" -- Highlight folds
vim.opt.foldlevelstart = 99 -- Don't close any folds at the start

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen" -- Keep the same relative cursor position when splitting

-- Indentation disabled because of vim-sleuth

-- vim.opt.expandtab = true -- Expand tabs to spaces
-- vim.opt.tabstop = 4 -- Width of a tab
-- vim.opt.shiftwidth = 4 -- Indent's width
-- vim.opt.shiftround = true -- Round indent to multiple of 'shiftwidth'

-- don't continue comments automagically
-- https://neovim.io/doc/user/options.html#'formatoptions'
vim.opt.formatoptions:remove "c"
vim.opt.formatoptions:remove "r"
vim.opt.formatoptions:remove "o"

-- Options

vim.opt.shortmess:append "Ic" -- Reduce vim's verboseness and remove intro message

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- vim: ts=2 sts=2 sw=2 et

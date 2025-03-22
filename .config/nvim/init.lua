-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- BOOTSTRAP the plugin manager `lazy.nvim` https://lazy.folke.io/installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazyLocallyAvailable = vim.uv.fs_stat(lazypath) ~= nil
if not lazyLocallyAvailable then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }):wait()
  if out.code ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  { "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically
  { "stevearc/dressing.nvim", opts = {} },
  { import = "custom/plugins" },
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>fh` then write `lazy.nvim-plugin`
}, {
  defaults = {
    lazy = false, -- whether to lazy load all plugins by default
    version = false, -- always use the latest git commit
  },
  checker = { enabled = false, frequency = 60 * 60 * 24 * 7 }, -- automatically check for plugin updates every week
  -- don't reload when config changes
  change_detection = {
    enabled = false,
  },
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

require "core.options"
require "core.keymaps"
require "core.autocmds"
require "core.lastpos"

-- vim: ts=2 sts=2 sw=2 et

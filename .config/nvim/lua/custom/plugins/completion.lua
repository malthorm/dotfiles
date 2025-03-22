return {
  -- { -- Autocompletion
  --   "hrsh7th/nvim-cmp",
  --   event = "InsertEnter",
  --   dependencies = {
  --     -- Snippet Engine & its associated nvim-cmp source
  --     {
  --       "onsails/lspkind.nvim",
  --       "L3MON4D3/LuaSnip",
  --       build = (function()
  --         -- Build Step is needed for regex support in snippets.
  --         -- This step is not supported in many windows environments.
  --         -- Remove the below condition to re-enable on windows.
  --         if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then
  --           return
  --         end
  --         return "make install_jsregexp"
  --       end)(),
  --       dependencies = {
  --         -- `friendly-snippets` contains a variety of premade snippets.
  --         --    See the README about individual language/framework/plugin snippets:
  --         --    https://github.com/rafamadriz/friendly-snippets
  --         -- {
  --         --   'rafamadriz/friendly-snippets',
  --         --   config = function()
  --         --     require('luasnip.loaders.from_vscode').lazy_load()
  --         --   end,
  --         -- },
  --       },
  --     },
  --     "saadparwaiz1/cmp_luasnip",
  --
  --     -- Adds other completion capabilities.
  --     --  nvim-cmp does not ship with all sources by default. They are split
  --     --  into multiple repos for maintenance purposes.
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-path",
  --     "hrsh7th/cmp-buffer",
  --   },
  --   config = function()
  --     -- See `:help cmp`
  --     local cmp = require "cmp"
  --     local luasnip = require "luasnip"
  --     local lspkind = require("lspkind")
  --     luasnip.config.setup {}
  --
  --     lspkind.init()
  --     local kind_formatter = lspkind.cmp_format({
  --       mode = "symbol_text",
  --       menu = {
  --         buffer = "[buf]",
  --         nvim_lsp = "[LSP]",
  --         nvim_lua = "[api]",
  --         path = "[path]",
  --         luasnip = "[snip]",
  --         gh_issues = "[issues]",
  --       },
  --     })
  --
  --     cmp.setup {
  --       snippet = {
  --         expand = function(args)
  --           luasnip.lsp_expand(args.body)
  --         end,
  --       },
  --       formatting = {
  --         fields = { "abbr", "kind", "menu" },
  --         expandable_indicator = true,
  --         format = function(entry, vim_item)
  --           -- Lspkind setup for icons
  --           vim_item = kind_formatter(entry, vim_item)
  --
  --           return vim_item
  --         end,
  --       },
  --       -- completion = { completeopt = "menu,menuone,noinsert" },
  --       -- For an understanding of why these mappings were
  --       -- chosen, you will need to read `:help ins-completion`
  --       --
  --       -- No, but seriously. Please read `:help ins-completion`, it is really good!
  --       mapping = cmp.mapping.preset.insert {
  --         ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  --
  --         -- Scroll the documentation window [b]ack / [f]orward
  --         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --
  --         -- Accept ([y]es) the completion.
  --         --  This will auto-import if your LSP supports it.
  --         --  This will expand snippets if the LSP sent a snippet.
  --         ["<C-y>"] = cmp.mapping.confirm {
  --           behavior = cmp.SelectBehavior.Insert,
  --           select = true,
  --         },
  --
  --         -- Manually trigger a completion from nvim-cmp.
  --         --  Generally you don't need this, because nvim-cmp will display
  --         --  completions whenever it has completion options available.
  --         ["<C-Space>"] = cmp.mapping.complete {},
  --         ["<C-l>"] = cmp.mapping(function()
  --           if luasnip.expand_or_locally_jumpable() then
  --             luasnip.expand_or_jump()
  --           end
  --         end, { "i", "s" }),
  --         ["<C-h>"] = cmp.mapping(function()
  --           if luasnip.locally_jumpable(-1) then
  --             luasnip.jump(-1)
  --           end
  --         end, { "i", "s" }),
  --
  --         -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
  --         --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
  --       },
  --       sources = {
  --         {
  --           name = "lazydev",
  --           -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
  --           group_index = 0,
  --         },
  --         { name = "nvim_lsp" },
  --         { name = "luasnip" },
  --         { name = "path" },
  --         { name = "buffer" },
  --       },
  --     }
  --     -- Set up vim-dadbod
  --     cmp.setup.filetype({ "sql" }, {
  --       sources = {
  --         { name = "vim.dadbod.completion" },
  --         { name = "buffer" },
  --       },
  --     })
  --   end,
  -- },
}
-- vim: ts=2 sts=2 sw=2 et

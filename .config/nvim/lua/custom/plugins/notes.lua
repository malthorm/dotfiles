return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "malthor",
          path = "/home/malthor/Sync/obsidian/second-brain",
        },
      },
      notes_subdir = "inbox",
      new_notes_location = "notes_subdir",
      -- formatted_file_name=$(date "+%Y-%m-%d")_${file_name}.md
      -- Optional, customize how note IDs are generated given an optional title.
      ---@param title string|?
      ---@return string
      note_id_func = function(title)
        local formatted_file_name = ""
        local date_prefix = os.date("%Y-%m-%d")
        if title ~= nil then
          local formatted_title = title:gsub("%s", "-")
          formatted_file_name = date_prefix .. "_" .. formatted_title
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          local random_filename = ""
          for _ = 1, 4 do
            random_filename = random_filename .. string.char(math.random(65, 90))
          end
          formatted_file_name = date_prefix .. "_" .. random_filename
        end
        return formatted_file_name
      end,

      disable_frontmatter = true,
      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M:%S",
      },
      -- key mappings, below are the defaults
      mappings = {
        -- overrides the 'gf' mapping to work on markdown/wiki links within your vault
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- toggle check-boxes
        ["<leader>ti"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      ui = {
        -- Disable some things below here because I set these manually for all Markdown files using treesitter
        checkboxes = {},
        bullets = {},
      },
    },
  },
}

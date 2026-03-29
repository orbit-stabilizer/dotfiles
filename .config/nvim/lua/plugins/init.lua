return {
  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        ide = "right",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "rust",
        "python",
        "clojure",
      },
    },
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  {
    "mrjones2014/smart-splits.nvim",
  },

  {
    "hrsh7th/nvim-cmp",
    config = function(_, opts)
      local cmp = require "cmp"

      local mappings = {
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<Tab>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
      }

      opts.mapping = vim.tbl_deep_extend("force", opts.mapping, mappings)
      cmp.setup(opts)
    end,
  },

  {
    "orbit-stabilizer/divide.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>ds",
        function()
          require("divide").subheader()
        end,
        desc = "[D]ivide with [S]ubheader",
      },
      {
        "<leader>dh",
        function()
          require("divide").header()
        end,
        desc = "[D]ivide with [H]eader",
      },
      {
        "<leader>dd",
        function()
          require("divide").divider()
        end,
        desc = "[D]ivide with [D]ivider",
      },
    },
  },

  {
    "Olical/conjure",
    lazy = false,
  },

  {
    "gpanders/nvim-parinfer",
    lazy = false,
  },

  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },

  {
    "radovanne/clay.nvim",
    dependencies = { "Olical/conjure" },
    ft = { "clojure" },
    config = function()
      local clay = require "clay"
      local wk = require "which-key"
      wk.add {
        { "<localleader>c", group = "Connect/Clay" },
        { "<localleader>cb", clay.ClayBrowse, desc = "Clay Browse" },
        { "<localleader>cw", clay.ClayWatch, desc = "Clay Watch" },
        { "<localleader>ch", clay.ClayPrintNamespaceToHiccup, desc = "Print Namespace to Hiccup" },
        { "<localleader>cn", clay.ClayMakeFile, desc = "Render Namespace" },
        { "<localleader>cqn", clay.ClayMakeFileQuarto, desc = "Render Namespace with Quarto" },
      }
    end,
  },
}

require("lazy").setup({
    {
    "lervag/vimtex",
        lazy = false,     -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
        -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "skim"
            vim.g.maplocalleader = ","
        end
    },
    {
        "iurimateus/luasnip-latex-snippets.nvim",
          config = function()
            require'luasnip-latex-snippets'.setup({ use_treesitter = true })
            -- or setup({)
            require("luasnip").config.setup { enable_autosnippets = true }
        end,
   },
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
    {
    "AstroNvim/AstroNvim",
    version = "^4", -- Remove version tracking to elect for nightly AstroNvim
    import = "astronvim.plugins",
    opts = { -- AstroNvim options must be set here with the `import` key
      mapleader = " ", -- This ensures the leader key must be configured before Lazy is set up
      maplocalleader = ",", -- This ensures the localleader key must be configured before Lazy is set up
      icons_enabled = true, -- Set to false to disable icons (if no Nerd Font is available)
      pin_plugins = nil, -- Default will pin plugins when tracking `version` of AstroNvim, set to true/false to override
      update_notifications = true, -- Enable/disable notification about running `:Lazy update` twice to update pinned plugins
    },
    },
    { import = "community" },
    { import = "plugins" },
    } --[[@as LazySpec]], {
    -- Configure any other `lazy.nvim` configuration options here
install = { colorscheme = { "astrotheme", "habamax" } },
ui = { backdrop = 100 },
  performance = {
    rtp = {
      -- disable some rtp plugins, add more to your liking
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
} --[[@as LazyConfig]])

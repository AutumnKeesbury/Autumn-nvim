-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      	opts.section.header.type = "group"
		opts.section.header.val = {
			{ type = "text", val = " █████╗ ██╗   ██╗████████╗██╗   ██╗███╗   ███╗███╗   ██╗ ███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗", opts = { hl = "NeovimDashboardLogo1", shrink_margin = false, position = "center" }, },
			{ type = "text", val = "██╔══██╗██║   ██║╚══██╔══╝██║   ██║████╗ ████║████╗  ██║ ██╔════╝██╔═══██╗██║   ██║██║████╗ ████║", opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" }, },
			{ type = "text", val = "███████║██║   ██║   ██║   ██║   ██║██╔████╔██║██╔██╗ ██║ █████╗  ██║   ██║██║   ██║██║██╔████╔██║", opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" }, },
			{ type = "text", val = "██╔══██║██║   ██║   ██║   ██║   ██║██║╚██╔╝██║██║╚██╗██║ ██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║", opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" }, },
			{ type = "text", val = "██║  ██║╚██████╔╝   ██║   ╚██████╔╝██║ ╚═╝ ██║██║ ╚████║ ███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║", opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" }, },
			{ type = "text", val = "╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═══╝ ╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝", opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" }, },
			{ type = "padding", val = 1, },
			{ type = "text", val = "Autumn's NeoVIM (◕‿◕✿)", opts = { hl = "NeovimDashboardUsername", shrink_margin = false, position = "center" }, },
		}
				-- Define and set highlight groups for each logo line
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = "#9d0208" }) -- Red
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = "#d00000" }) -- Red-Orange
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = "#dc2f02" }) -- Orange-red
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = "#e85d04" }) -- Orange-Yellow
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo5", { fg = "#f48c06" }) -- Yellow-Orange
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo6", { fg = "#faa307" }) -- Yellow
		vim.api.nvim_set_hl(0, "NeovimDashboardUsername", { fg = "#ffc971" }) -- Faded Red
		-- stylua: ignore
		vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#311B92" })       -- Dark Indigo
		vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#8BC34A" })     -- Greenish
		vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#edd691" })
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}

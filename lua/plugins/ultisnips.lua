return {
  {
    "SirVer/ultisnips",
    -- dependencies = {
    --   {
    --     "honza/vim-snippets",
    --   },
    -- },
    init = function()
      -- vim.g.UltiSnipsSnippetDirectories = { "~/.config/nvim/UltiSnips" }
      vim.g.UltiSnipsExpandTrigger = "<tab>"
      vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "quangnguyen30192/cmp-nvim-ultisnips",
      { "saadparwaiz1/cmp_luasnip", enabled = false, keys = {
        { "<tab>", false },
      } },
    },
    opts = function(_, opts)
      local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
          end,
        },
        sources = {
          { name = "ultisnips" },
          -- more sources
        },
        -- recommended configuration for <Tab> people:
        mapping = {
          ["<Tab>"] = cmp.mapping(function(fallback)
            cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
          end, {
            "i",
            "s", --[[ "c" (to enable the mapping in command mode) ]]
          }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            cmp_ultisnips_mappings.jump_backwards(fallback)
          end, {
            "i",
            "s", --[[ "c" (to enable the mapping in command mode) ]]
          }),
        },
      })
      opts.snippet = {
        expand = function(args)
          vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      }
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "ultisnips" },
        { name = "buffer" },
        { name = "path" },
      })
    end,
  },
}

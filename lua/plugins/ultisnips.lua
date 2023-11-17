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
      { "saadparwaiz1/cmp_luasnip", enabled = false },
    },
    opts = function(_, opts)
      local cmp = require("cmp")
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

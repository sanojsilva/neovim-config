return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- disable a keymap
    keys[#keys + 1] = { "K", false }
  end,
  opts = {
    servers = {
      vtsls = {
        enabled = false,
      },
    },
    inlay_hints = { enabled = false },
    capabilities = {
      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          rangeLimit = 1000,
          lineFoldingOnly = true,
        },
      },
    },
  },
}

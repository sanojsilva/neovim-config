-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("i", "jj", "<esc>", { desc = "Go to normal mode" })
map({ "n", "v" }, "J", "10j", { desc = "Move 10 lines down", silent = true })
-- directly set the K keymap to avoid overriding the default help keymap
map("n", "<leader>i", "<cmd>w<cr>", { desc = "Save file", silent = true, noremap = true })

vim.keymap.set({ "n", "v" }, "K", "10k", { desc = "Move 10 lines up", silent = true, noremap = true })
vim.keymap.set("n", "gh", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "<leader>n", "<cmd>Neotree reveal<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>qw", "<cmd>q<cr>", { silent = true, noremap = true, desc = ":q" })
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
-- vim.keymap.del("n", "<leader>fc")
vim.keymap.set("n", "<leader>fc", "zc", { silent = true, noremap = true, desc = "Fold Close" })
vim.keymap.set("n", "<leader>fo", "zo", { silent = true, noremap = true, desc = "Fold Open" })
vim.keymap.set("n", "<leader>fO", "zO", { silent = true, noremap = true, desc = "Open all folds under cursor" })
vim.keymap.set("n", "<leader>fC", "zC", { silent = true, noremap = true, desc = "Close all folds under cursor" })
-- vim.keymap.set("n", "t", "g,", { silent = true, noremap = true, desc = "g, Changes list" })
-- vim.keymap.set("n", "e", "g;", { silent = true, noremap = true, desc = "g; Changes list" })
vim.keymap.set("n", "t", "<C-i>", { silent = true, noremap = true, desc = "g, Changes list" })
vim.keymap.set("n", "e", "<C-o>;", { silent = true, noremap = true, desc = "g; Changes list" })

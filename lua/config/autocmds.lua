-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd("set pumblend=0")
vim.cmd("autocmd FileType harpoon nnoremap <buffer><silent> l :lua require('harpoon.ui').select_menu_item()<CR>")
vim.cmd("let g:snipMate = { 'snippet_version' : 1 }")
vim.cmd("highlight FlashLabel ctermbg=red guibg=red")
vim.cmd("set notimeout")
vim.cmd("set updatetime=1500")
vim.cmd("autocmd CursorHold * normal! m")

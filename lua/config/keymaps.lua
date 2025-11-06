-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<leader>fw", ":write<CR>:source<CR>", { desc = "Write and source" })
map("n", "<leader>t", ":15new<CR>:term<CR>", { desc = "Open a terminal" })
map("n", "<leader>h", ":CodeCompanionChat<CR>", { desc = "Opens Code Companion Chat" })

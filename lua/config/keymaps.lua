-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

local n = "n"

-- dap stuff
map(n, "<leader>dk", function()
  require("dap").continue()
end, { desc = "Start/Continue Debugging" })
map(n, "<leader>dl", function()
  require("dap").run_last()
end, { desc = "Run Last Debugging Session" })
map(n, "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })

map(n, "<leader>fw", ":write<CR>:source<CR>", { desc = "Write and source" })
map(n, "<leader>h", ":CodeCompanionChat<CR>", { desc = "Opens Code Companion Chat" })

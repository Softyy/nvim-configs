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
map(n, "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Set Conditional Breakpoint" })
map(n, "<leader>dj", function()
  require("dap").step_over()
end, { desc = "Step Over" })
map(n, "<leader>di", function()
  require("dap").step_into()
end, { desc = "Step Into" })
map(n, "<leader>do", function()
  require("dap").step_out()
end, { desc = "Step Out" })
map(n, "<leader>dr", function()
  require("dap").repl.open()
end, { desc = "Open Debug REPL" })
map(n, "<leader>dt", function()
  require("dap").terminate()
end, { desc = "Terminate Debug Session" })

map(n, "<leader>fw", ":write<CR>:source<CR>", { desc = "Write and source" })
map(n, "<leader>h", ":CodeCompanionChat<CR>", { desc = "Opens Code Companion Chat" })

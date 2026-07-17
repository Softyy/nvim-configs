local util = require("conform.util")

return {
  "conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      html = { "prettierd", "prettier", stop_after_first = true },
      css = { "prettierd" },

      yaml = { "prettierd" },
      json = { "prettierd" },

      elixir = { "mix_format" },
      erlang = { "erlfmt" },

      python = { "ruff_format" },
      rust = { "rustfmt", lsp_format = "fallback" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      vue = { "prettierd", "prettier", stop_after_first = true },
    },

    formatters = {
      ruff_format = {
        command = util.find_executable({ ".venv/bin/ruff", "venv/bin/ruff" }, "ruff"),
      },
    },
  },
}
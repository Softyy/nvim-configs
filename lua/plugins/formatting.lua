return {
  "conform.nvim",
  opts = {

    formatters_by_ft = {
      lua = { "stylua" },
      html = { "prettierd" },
      css = { "prettierd" },

      yaml = { "prettierd" },
      json = { "prettierd" },

      -- Conform will run multiple formatters sequentially
      python = { "isort", "black" },
      -- You can customize some of the format options for the filetype (:help conform.format)
      rust = { "rustfmt", lsp_format = "fallback" },
      -- Conform will run the first available formatter
      javascript = { "prettierd", "prettier", stop_after_first = true },
    },
  },
}

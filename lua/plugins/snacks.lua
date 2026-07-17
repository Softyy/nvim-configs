return {
  "folke/snacks.nvim",
  opts = {
    explorer = {},
    picker = {
      win = {
        preview = { wo = { wrap = true, linebreak = true, breakindent = true } },
      },
      sources = {
        explorer = {
          layout = { preset = "sidebar", preview = false, layout = { position = "right" } },
          hidden = true,
        },
      },
    },
  },
}

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,

  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      styles = {
        comments = { "italic" },
        functions = { "italic", "bold" },
        keywords = { "bold" },
        variables = { "italic", "bold" },
        types = { "italic", "bold" },
      },
    })
  end,
}

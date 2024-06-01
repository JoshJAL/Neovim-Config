return {
  "navarasu/onedark.nvim",
  lazy = true,
  priority = 1000,
  config = function()
    require("onedark").setup({
      style = "darker",
      transparent = true,
      ending_tildes = true,
      code_style = {
        keywords = "bold",
        functions = "italic",
        variables = "bold",
      },
    })
  end,
}

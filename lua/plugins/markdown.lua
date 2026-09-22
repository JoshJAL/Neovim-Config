-- Always run markdownlint-cli2 against a global config so MD013 (and any other
-- global rule preferences) apply in every project, even those without a local
-- .markdownlint.* file. A project-level config still takes precedence because
-- markdownlint-cli2 merges discovered configs over the --config base.
return {
  "mfussenegger/nvim-lint",
  opts = function()
    local linter = require("lint").linters["markdownlint-cli2"]
    linter.args = {
      "--config",
      vim.fn.expand("~/.config/markdownlint/.markdownlint.jsonc"),
      "-",
    }
  end,
}

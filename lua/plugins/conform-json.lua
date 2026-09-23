return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    -- Prettier only expands an object onto multiple lines if the original
    -- source had a newline between `{` and the first key, so it returns
    -- minified JSON completely unchanged. Run jq first to give the file a
    -- real structure, then let prettier apply the usual style on top.
    -- Left as prettier-only for jsonc/json5, which jq cannot parse.
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters_by_ft.json = { "jq", "prettier" }
    return opts
  end,
}

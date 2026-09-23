return {
  "folke/snacks.nvim",
  opts = {
    bigfile = {
      -- snacks derives "average line length" as bytes/lines, so a minified
      -- JSON on a single line trips this no matter how small the file is.
      -- The size check above still catches genuinely large files.
      line_length = 100000,
    },
    picker = {
      ignored = true, -- show .gitignored files in all pickers by default
      sources = {
        explorer = {
          layout = {
            layout = { position = "right" },                              -- Nested layout key as per the docs
          },
          hidden = true,                                                  -- Include hidden files
          ignored = true,                                                 -- Respect .gitignore
          exclude = { "node_modules", ".git", ".next", "dist", "build" }, -- Exclude specific directories
        },
        files = {
          hidden = true,    -- Include hidden files
          ignored = true,   -- Respect .gitignore
          args = {
            "--hidden",     -- Include hidden files
            "--exclude",
            "node_modules", -- Exclude node_modules
            "--exclude",
            ".git",         -- Exclude .git
            "--exclude",
            ".next",        -- Exclude Next.js build files
            "--exclude",
            "dist",         -- Exclude dist directories
            "--exclude",
            "build",        -- Exclude build directories
          },
        },
      },
    },
  },
}

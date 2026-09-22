return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  keys = {
    { "<leader>cc", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude Code" },
    { "<leader>cf", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude Code" },
    { "<leader>cr", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude Code" },
    { "<leader>cC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude Code" },
    { "<leader>cm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select model" },
    { "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add buffer to context" },
    { "<leader>cs", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                    desc = "Send selection" },
    { "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>",  desc = "Accept diff" },
    { "<leader>cD", "<cmd>ClaudeCodeDiffDeny<cr>",    desc = "Deny diff" },
    {
      "<leader>cs",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file (tree)",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
    },
  },
}

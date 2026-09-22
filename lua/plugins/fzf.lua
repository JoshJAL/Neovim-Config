return {
  "ibhagwan/fzf-lua",
  opts = {
    -- File search (fd): include .gitignored files by default (`--no-ignore`),
    -- but still skip the heavy build/vcs dirs. Toggle live with <a-i>.
    fd_opts = "--color=never --type f --type l --no-ignore"
      .. " --exclude .git --exclude .jj --exclude node_modules"
      .. " --exclude .next --exclude dist --exclude build",
    files = {
      -- fallback when fd is unavailable (rg-based file listing)
      rg_opts = '--color=never --files --no-ignore -g "!.git" -g "!.jj"'
        .. ' -g "!node_modules" -g "!.next" -g "!dist" -g "!build"',
    },
    grep = {
      -- live grep / grep: also search ignored files by default
      rg_opts = "--column --line-number --no-heading --color=always --smart-case"
        .. " --max-columns=4096 --no-ignore"
        .. ' -g "!.git" -g "!node_modules" -g "!.next" -g "!dist" -g "!build" -e',
    },
  },
}

-- Make highlight groups transparent while preserving their other attributes
local function make_transparent(name)
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
  if ok then
    ---@type vim.api.keyset.highlight
    local transparent = {
      fg = hl.fg,
      sp = hl.sp,
      blend = hl.blend,
      altfont = hl.altfont,
      bold = hl.bold,
      standout = hl.standout,
      underline = hl.underline,
      undercurl = hl.undercurl,
      underdouble = hl.underdouble,
      underdotted = hl.underdotted,
      underdashed = hl.underdashed,
      strikethrough = hl.strikethrough,
      italic = hl.italic,
      reverse = hl.reverse,
      nocombine = hl.nocombine,
      default = hl.default,
      ctermfg = hl.ctermfg,
      ctermbg = hl.ctermbg,
    }

    vim.api.nvim_set_hl(0, name, transparent)
  end
end

local groups = {
  -- transparent background
  "Normal",
  "NormalFloat",
  "FloatBorder",
  "Pmenu",
  "Terminal",
  "EndOfBuffer",
  "FoldColumn",
  "Folded",
  "SignColumn",
  "LineNr",
  "CursorLineNr",
  "NormalNC",
  "WhichKeyFloat",
  "TelescopeBorder",
  "TelescopeNormal",
  "TelescopePromptBorder",
  "TelescopePromptTitle",
  -- neotree
  "NeoTreeNormal",
  "NeoTreeNormalNC",
  "NeoTreeVertSplit",
  "NeoTreeWinSeparator",
  "NeoTreeEndOfBuffer",
  -- nvim-tree
  "NvimTreeNormal",
  "NvimTreeVertSplit",
  "NvimTreeEndOfBuffer",
  -- notify
  "NotifyINFOBody",
  "NotifyERRORBody",
  "NotifyWARNBody",
  "NotifyTRACEBody",
  "NotifyDEBUGBody",
  "NotifyINFOTitle",
  "NotifyERRORTitle",
  "NotifyWARNTitle",
  "NotifyTRACETitle",
  "NotifyDEBUGTitle",
  "NotifyINFOBorder",
  "NotifyERRORBorder",
  "NotifyWARNBorder",
  "NotifyTRACEBorder",
  "NotifyDEBUGBorder",
}

for _, name in ipairs(groups) do
  make_transparent(name)
end

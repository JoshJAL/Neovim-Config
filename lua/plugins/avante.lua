local function patch_openai_response_tool_outputs()
  local ok, Providers = pcall(require, "avante.providers")
  if not ok then
    return
  end

  local ok_openai, openai = pcall(function()
    return Providers.openai
  end)
  if not ok_openai or openai._terra_response_tool_output_patch then
    return
  end

  openai._terra_response_tool_output_patch = true

  local parse_curl_args = openai.parse_curl_args
  openai.parse_curl_args = function(self, prompt_opts)
    self.last_response_id = nil
    local args = parse_curl_args(self, prompt_opts)
    local input = args and args.body and args.body.input
    if type(input) ~= "table" then
      return args
    end

    local calls = {}
    local outputs = {}
    for _, item in ipairs(input) do
      if item.type == "function_call" and item.call_id then
        calls[item.call_id] = true
      elseif item.type == "function_call_output" and item.call_id then
        outputs[item.call_id] = true
      end
    end

    local filtered = {}
    for _, item in ipairs(input) do
      local keep = true
      if item.type == "function_call" then
        keep = item.call_id and outputs[item.call_id]
      elseif item.type == "function_call_output" then
        keep = item.call_id and calls[item.call_id]
      end
      if keep then
        table.insert(filtered, item)
      end
    end
    args.body.input = filtered

    return args
  end
end

return {
  {
    "yetone/avante.nvim",
    dependencies = {
      { "ColinKennedy/mega.cmdparse", dependencies = { "ColinKennedy/mega.logging" } },
    },
    keys = {
      {
        "<leader>ae",
        function()
          require("avante.api").edit()
        end,
        mode = "v",
        desc = "Edit selected block with Avante",
      },
      {
        "<leader>ap",
        "<cmd>AvanteSwitchProvider<cr>",
        desc = "Switch Avante provider",
      },
    },
    opts = {
      provider = "openai",
      providers = {
        openai = {
          model = "gpt-5.6-terra",
          use_response_api = true,
          support_previous_response_id = false,
          extra_request_body = {
            reasoning_effort = "high",
            max_completion_tokens = 16384,
          },
        },
        claude = {
          model = "claude-sonnet-4-20250514",
          timeout = 30000,
          extra_request_body = {
            max_tokens = 16384,
          },
        },
      },
    },
    config = function(_, opts)
      require("avante").setup(opts)
      patch_openai_response_tool_outputs()
    end,
  },
}

return {
  {

    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    config = function() require("copilot").setup({}) end
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function() require("copilot_cmp").setup() end
  },
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   branch = "canary",
  --   dependencies = {
  --     { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
  --     { "nvim-lua/plenary.nvim" }   -- for curl, log wrapper
  --   },
  --   build = "make tiktoken",        -- Only on MacOS or Linux
  --   opts = {
  --     debug = true                  -- Enable debugging
  --     -- See Configuration section for rest
  --   },
  --   -- See Commands section for default commands if you want to lazy load on them
  --   keys = {
  --     { "<c-s>",      "<CR>",                                                ft = "copilot-chat",           desc = "Submit Prompt", remap = true },
  --     { "<leader>a",  "",                                                    desc = "+ai",                  mode = { "n", "v" } },
  --     { "<leader>aa", function() return require("CopilotChat").toggle() end, desc = "Toggle (CopilotChat)", mode = { "n", "v" } },
  --     { "<leader>ax", function() return require("CopilotChat").reset() end,  desc = "Clear (CopilotChat)",  mode = { "n", "v" } },
  --     {
  --       "<leader>aq",
  --       function()
  --         local input = vim.fn.input("Quick Chat: ")
  --         if input ~= "" then require("CopilotChat").ask(input) end
  --       end,
  --       desc = "Quick Chat (CopilotChat)",
  --       mode = { "n", "v" }
  --     }                                                                                                                                                                                             -- Show help actions with telescope
  --     -- {
  --     --     "<leader>ad",
  --     --     M.pick("help"),
  --     --     desc = "Diagnostic Help (CopilotChat)",
  --     --     mode = {"n", "v"}
  --     -- }, -- Show prompts actions with telescope
  --     -- {
  --     --     "<leader>ap",
  --     --     M.pick("prompt"),
  --     --     desc = "Prompt Actions (CopilotChat)",
  --     --     mode = {"n", "v"}
  --     -- }
  --   }
  -- }
}

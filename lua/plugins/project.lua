return {

  "ahmedkhalf/project.nvim",
  opts = {
    manual_mode = true,
  },
  --TODO: can't delete project yaohua, but all the other projects can be deleted. what is manual mode
  event = "VeryLazy",
  lazy = false,
  keys = {
    {
      "<leader>p",
      function()
        require("telescope").extensions.projects.projects({})
      end,
      desc = "Open Projects",
    },
  },
  config = function(_, opts)
    require("project_nvim").setup(opts)
    require("telescope").load_extension("projects")
  end,
}

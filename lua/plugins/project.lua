return {

  "ahmedkhalf/project.nvim",
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
  config = function()
    require("project_nvim").setup({})
    require("telescope").load_extension("projects")
  end,
}

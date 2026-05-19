return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      -- You can add catppuccin specific options here later
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.opt.termguicolors = true
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- Paste everything inside your current require("lualine").setup({ ... }) here.
      -- lazy.nvim will automatically call the setup function with these opts!
      options = {
        icons_enabled = true,
        theme = "auto",
        -- ... (rest of your lualine config)
      },
    }
  },
}
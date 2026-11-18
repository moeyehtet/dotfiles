-- 1. Load options and autocmds
require("config.options")

-- 2. Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 3. Load plugins from the `lua/plugins/` directory
require("lazy").setup("plugins", {
  install = { colorscheme = { "catppuccin", "habamax" } },
  checker = { enabled = false },
})

-- neotree - autoclose on open file
require("neo-tree").setup({
    event_handlers = {
        {
            event = "file_opened",
            handler = function(file_path)
                require("neo-tree.command").execute({ action = "close" })
            end
        },
    }
})

require("config.lsp")

vim.opt.termguicolors = true
vim.cmd.colorscheme("catppuccin")

-- ==========================
-- OPTIONS
-- ==========================
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.signcolumn = "auto"
vim.opt.colorcolumn = "100"
vim.opt.showmatch = true
vim.opt.cmdheight = 1
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.showmode = false
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.winblend = 0
vim.opt.conceallevel = 2
vim.opt.concealcursor = ""
vim.opt.lazyredraw = true
vim.opt.synmaxcol = 300
vim.opt.fillchars = { eob = " " }

local undodir = vim.fn.expand("~/.vim/undodir")
if
	vim.fn.isdirectory(undodir) == 0 -- create undodir if nonexistent
then
	vim.fn.mkdir(undodir, "p")
end

vim.opt.backup = false -- do not create a backup file
vim.opt.writebackup = false -- do not write to a backup file
vim.opt.swapfile = false -- do not create a swapfile
vim.opt.undofile = true -- do create an undo file
vim.opt.undodir = undodir -- set the undo directory
vim.opt.updatetime = 300 -- faster completion
vim.opt.timeoutlen = 500 -- timeout duration
vim.opt.ttimeoutlen = 50 -- key code timeout
vim.opt.autoread = true -- auto-reload changes if outside of neovim
vim.opt.autowrite = false -- do not auto-save

vim.opt.hidden = true -- allow hidden buffers
vim.opt.errorbells = false -- no error sounds
vim.opt.backspace = "indent,eol,start" -- better backspace behaviour
vim.opt.autochdir = false -- do not autochange directories
vim.opt.iskeyword:append("-") -- include - in words
vim.opt.path:append("**") -- include subdirs in search
vim.opt.selection = "inclusive" -- include last char in selection
vim.opt.mouse = "a" -- enable mouse support
vim.opt.clipboard:append("unnamedplus") -- use system clipboard
vim.opt.modifiable = true -- allow buffer modifications
vim.opt.encoding = "utf-8" -- set encoding

vim.opt.guicursor =
	"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175" -- cursor blinking and settings

-- Folding: requires treesitter available at runtime; safe fallback if not
vim.opt.foldmethod = "expr" -- use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use treesitter for folding
vim.opt.foldlevel = 99 -- start with all folds open

vim.opt.splitbelow = true -- horizontal splits go below
vim.opt.splitright = true -- vertical splits go right

vim.opt.wildmenu = true -- tab completion
vim.opt.wildmode = "longest:full,full" -- complete longest common match, full completion list, cycle through with Tab
vim.opt.diffopt:append("linematch:60") -- improve diff display
vim.opt.redrawtime = 10000 -- increase neovim redraw tolerance
vim.opt.maxmempattern = 20000 -- increase max memory

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

-- ========================
-- PLUGINS
-- ========================
vim.pack.add({
  { 
    src = "https://github.com/catppuccin/nvim", 
    name = "catppuccin" 
  },
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
  },
  {
    src = "https://github.com/windwp/nvim-autopairs",
    version = "master",
  },
  {
    src = "https://github.com/nvim-tree/nvim-web-devicons",
    name = "nvim-web-devicons"
  },
  {
    src = "https://github.com/nvim-lualine/lualine.nvim",
    name = "lualine"
  }
})

require("nvim-treesitter").setup({})
require("nvim-treesitter").install({
  "bash",
  "c",
  "comment",
  "css",
  "diff",
  "dockerfile",
  "fish",
  "gitcommit",
  "gitignore",
  "html",
  "javascript",
  "json",
  "lua",
  "make",
  "markdown",
  "markdown_inline",
  "nginx",
  "python",
  "query",
  "regex",
  "rust",
  "scss",
  "sql",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "xml",
  "yaml",
})
require('nvim-autopairs').setup({})
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

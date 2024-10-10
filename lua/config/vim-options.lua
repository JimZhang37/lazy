local vim = vim
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set winbar='%f'")
vim.cmd("set number")
vim.cmd("set number")

vim.opt.wrap = false
vim.opt.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
-- vim.o.foldtext = 'v:lua.vim.treesitter.foldtext()'  -- Example using Tree-sitter to show fold text
vim.o.fillchars = 'fold: ' -- Set the character used to fill folded lines
vim.o.foldminlines = 1     -- Minimum number of lines required to fold
vim.wo.foldcolumn = '1'

vim.g.mapleader = " "
vim.api.nvim_set_keymap('i', '<A-e>', '<Esc>:echo "Alt-e pressed"<CR>',
    { noremap = true, silent = true })                   -- meta-e

vim.o.cursorline = true

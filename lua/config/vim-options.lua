local vim = vim
vim.cmd("set expandtab")
vim.cmd("set softtabstop=2")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.opt.relativenumber = true

vim.cmd("set winbar='%f'")

vim.opt.wrap = false
vim.opt.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
-- vim.o.foldtext = 'v:lua.vim.treesitter.foldtext()'  -- Example using Tree-sitter to show fold text
vim.o.fillchars = "fold: " -- Set the character used to fill folded lines
vim.o.foldminlines = 1     -- Minimum number of lines required to fold
vim.wo.foldcolumn = "1"

vim.g.mapleader = " "

vim.o.cursorline = true

-- lazygit
--map("n", "<leader>gg", function() LazyVim.lazygit( { cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
--map("n", "<leader>gG", function() LazyVim.lazygit() end, { desc = "Lazygit (cwd)" })
--map("n", "<leader>gb", LazyVim.lazygit.blame_line, { desc = "Git Blame Line" })
--map("n", "<leader>gB", LazyVim.lazygit.browse, { desc = "Git Browse" })

-- windows
vim.api.nvim_set_keymap("n", "<leader>w", "<c-w>", { desc = "Windows", noremap = true })
vim.api.nvim_set_keymap("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", noremap = true })
vim.api.nvim_set_keymap("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", noremap = true })
vim.api.nvim_set_keymap("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", noremap = true })
--LazyVim.toggle.map("<leader>wm", LazyVim.toggle.maximize)

-- tabs
vim.api.nvim_set_keymap("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.api.nvim_set_keymap("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
vim.api.nvim_set_keymap("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.api.nvim_set_keymap("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.api.nvim_set_keymap("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.api.nvim_set_keymap("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.api.nvim_set_keymap("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

--TODO: why rename is not working.
--TODO: add function to open terminal in a particular directory
-- floating terminal
lazyterm = function() require("me.terminal").open() end
vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>lua lazyterm()<CR>", { desc = "Terminal (Root Dir)" })
-- vim.api.nvim_set_keymap("n", "<leader>fT", function() LazyVim.terminal() end, { desc = "Terminal (cwd)" })
vim.api.nvim_set_keymap("n", "<c-/>", "<cmd>lua lazyterm()<CR>", { desc = "Terminal (Root Dir)" })
vim.api.nvim_set_keymap("n", "<c-_>", "<cmd>lua lazyterm()<CR>", { desc = "which_key_ignore" })

-- Terminal Mappings
vim.api.nvim_set_keymap("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
vim.api.nvim_set_keymap("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
vim.api.nvim_set_keymap("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
vim.api.nvim_set_keymap("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
vim.api.nvim_set_keymap("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
vim.api.nvim_set_keymap("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
vim.api.nvim_set_keymap("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- quit
vim.api.nvim_set_keymap("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- stylua: ignore start
--

-- save file
vim.api.nvim_set_keymap("i", "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
vim.api.nvim_set_keymap("x", "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
vim.api.nvim_set_keymap("n", "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
vim.api.nvim_set_keymap("s", "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- buffers
vim.api.nvim_set_keymap("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.api.nvim_set_keymap("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.api.nvim_set_keymap("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.api.nvim_set_keymap("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.api.nvim_set_keymap("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.api.nvim_set_keymap("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
--map("n", "<leader>bd", LazyVim.ui.bufremove, { desc = "Delete Buffer" })
vim.api.nvim_set_keymap("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Move Lines
vim.api.nvim_set_keymap("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
vim.api.nvim_set_keymap("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
vim.api.nvim_set_keymap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.api.nvim_set_keymap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Move to window using the <ctrl> hjkl keys
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", noremap = true })

-- Resize window using <ctrl> arrow keys
vim.api.nvim_set_keymap("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.api.nvim_set_keymap("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.api.nvim_set_keymap("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.api.nvim_set_keymap("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })


vim.api.nvim_set_keymap('n', '<A-m>', ':echo "Test Alt Key"<CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', "<leader>cl", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })

vim.api.nvim_set_keymap('n', "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Goto Definition", })
-- vim.api.nvim_set_keymap('n', "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "References", })
vim.api.nvim_set_keymap('n', "gr", "<cmd>Telescope lsp_references<CR>", { desc = "References", })
vim.api.nvim_set_keymap('n', "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Goto Implementation" })
vim.api.nvim_set_keymap('n', "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "Goto T[y]pe Definition" })

--close scratch buffer
vim.api.nvim_create_user_command('CloseScratch', function()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_get_option_value('buftype', { buf = buf }) == 'nofile' then
      -- if vim.api.nvim_buf_get_option(buf, 'buftype') == 'nofile' then     This api has deprecated
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, {})

vim.api.nvim_set_keymap('n', '<leader>cc', ':CloseScratch<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- better indenting
vim.api.nvim_set_keymap("v", "<", "<gv", {})
vim.api.nvim_set_keymap("v", ">", ">gv", {})

-- restore q's capability to start macro TODO: doesn't work
vim.api.nvim_set_keymap('n', 'q', 'q', { noremap = true, silent = true })


-- lazygit

lazygit = function() require("me.lazygit").open() end
vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua lazygit()<CR>", { desc = "Lazygit (Root Dir)" })
-- vim.api.nvim_set_keymap("n", "<leader>gG", function() LazyVim.lazygit() end, { desc = "Lazygit (cwd)" })
-- vim.api.nvim_set_keymap("n", "<leader>gb", LazyVim.lazygit.blame_line, { desc = "Git Blame Line" })
-- vim.api.nvim_set_keymap("n", "<leader>gB", LazyVim.lazygit.browse, { desc = "Git Browse" })
--
-- vim.api.nvim_set_keymap("n", "<leader>gf", function()
--   local git_path = vim.api.nvim_buf_get_name(0)
--   LazyVim.lazygit({args = { "-f", vim.trim(git_path) }})
-- end, { desc = "Lazygit Current File History" })
--
-- vim.api.nvim_set_keymap("n", "<leader>gl", function()
--   LazyVim.lazygit({ args = { "log" }, cwd = LazyVim.root.git() })
-- end, { desc = "Lazygit Log" })
-- map("n", "<leader>gL", function()
--   LazyVim.lazygit({ args = { "log" } })
-- end, { desc = "Lazygit Log (cwd)" })
--
--

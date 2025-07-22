
-- theme
vim.cmd.colorscheme("unokai")

-- basic settings
vim.o.number = true  -- line numbers
vim.o.relativenumber = true  -- relative line numbers
vim.o.cursorline = true  -- highlight current line
vim.o.wrap = false  -- don't wrap lines
vim.o.scrolloff = 10  -- keep 10 lines above/below cursor
vim.o.sidescrolloff = 8 -- keep 8 lines above/below cursor

-- Indentation
vim.o.tabstop = 2  -- tab width
vim.o.shiftwidth = 2  -- indent width
vim.o.softtabstop = 2  -- soft tab stop
vim.o.expandtab = true  -- use spaces instead of tabs
vim.o.smartindent = true  -- smart auto-indenting
vim.o.autoindent = true  -- copy indent from current line

-- Search settings
vim.o.ignorecase = true  -- case insensitive search
vim.o.smartcase = true  -- Case sensitive if uppercase in search
vim.o.hlsearch = false  -- Don't highlight search results
vim.o.incsearch = true  -- Show matches as you type

-- Visual Settings
vim.o.termguicolors = true  -- Enable 24 bit color
vim.o.signcolumn = "yes"  -- Always show sign column
vim.o.colorcolumn = "120"  -- Show column at 120 chars
vim.o.showmatch = true  -- Highlight matching brackets
vim.o.cmdheight = 1
vim.o.completeopt = "menuone,noinsert,noselect"  -- completion options
vim.o.showmode = false  -- Don't show mode in command line
vim.o.pumheight = 10  -- Popup menu height
vim.o.pumblend = 10  -- popup menu transparency
vim.o.winblend = 0  -- floating window transparency
vim.o.conceallevel = 0  -- don't hide markup
vim.o.concealcursor = "" -- don't hide cursor line markup
vim.o.lazyredraw = true  -- don't redraw during macros
vim.o.synmaxcol = 300  -- Syntax highlighting limit

-- File handling
vim.o.backup = false  -- Don't create backup files
vim.o.writebackup = false  -- Don't create backup before writing
vim.o.swapfile = false  -- Don't create swap files
vim.o.undofile = true  -- persistent undo
vim.o.updatetime = 250  -- faster completion
vim.o.timeoutlen = 500  -- Key timeout duration
vim.o.ttimeoutlen = 0  -- Key code timeout
vim.o.autoread = true  -- Auto reload files changed outside of vim
vim.o.autowrite = false  -- Don't autosave

-- Behavior settings
vim.o.hidden = true  -- Allow hidden buffers
vim.o.errorbells = false  -- No error bells
vim.o.backspace = "indent,eol,start"  -- better backspace behavior
vim.o.autochdir = false  -- don't auto change directory
vim.opt.path:append("**")  -- include subdirectories in search
vim.o.mouse = "a"  -- enable mouse mode
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end) -- schedule using system clipboard
vim.o.modifiable = true  -- allow buffer modifications
vim.o.encoding = "UTF-8"

-- Folding settings
vim.o.foldmethod = "expr"  -- Use expression for folding
vim.o.foldexpr = "nvim_treesitter#foldexpr()"  -- use treesitter for folding
vim.o.foldlevel = 99  -- start with all folds open

-- Split behavior
vim.o.splitbelow = true  -- Horizontal splits go right
vim.o.splitright = true  -- Vertical splits go right

-- Key mappings
vim.g.mapleader = " "  -- Set leader key to space
vim.g.maplocalleader = " "  -- Set local leader key to space

-- Normal Mode Mappings
vim.keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>')  -- clear search highlights on ESC

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror message' })

-- Y to EOL
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Better paste behavior
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Splitting
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })

-- Buffer Commands
--
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete buffer', noremap = true, silent = true })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer', noremap = true, silent = true })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer', noremap = true, silent = true })

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Quick file navigation
vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Find file" })

-- Terminal mappings
--
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })







-- Autocommands
--
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
test = {test}

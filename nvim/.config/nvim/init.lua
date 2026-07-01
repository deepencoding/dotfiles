-- ~/.config/nvim/init.lua
-- Kickstart-style: ONE file you can read top to bottom. Grow it yourself.
-- Rule: never add a plugin you can't explain the purpose of.

-- ════════════════════════ OPTIONS ════════════════════════
vim.g.mapleader = ' '            -- <leader> = Space
vim.g.maplocalleader = ' '

local o = vim.opt
o.number = true                  -- absolute line number on cursor line
o.relativenumber = true         -- relative elsewhere → makes 5j/12k natural
o.mouse = 'a'                    -- allowed during transition; wean later
o.showmode = false               -- statusline plugins show it anyway
o.clipboard = 'unnamedplus'      -- yank/paste ↔ system clipboard
o.breakindent = true
o.undofile = true                -- persistent undo across sessions
o.ignorecase = true
o.smartcase = true               -- case-sensitive only if query has caps
o.signcolumn = 'yes'
o.updatetime = 250
o.timeoutlen = 400               -- which-key popup delay
o.splitright = true
o.splitbelow = true
o.list = true                    -- show invisible chars
o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
o.inccommand = 'split'           -- live preview of :s substitutions
o.cursorline = true
o.scrolloff = 8
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.termguicolors = true

-- ════════════════════════ KEYMAPS ════════════════════════
local map = vim.keymap.set
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })
map('n', '<C-h>', '<C-w>h', { desc = 'Focus left split' })
map('n', '<C-j>', '<C-w>j', { desc = 'Focus lower split' })
map('n', '<C-k>', '<C-w>k', { desc = 'Focus upper split' })
map('n', '<C-l>', '<C-w>l', { desc = 'Focus right split' })
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
map('n', '<leader>e', '<cmd>Oil<CR>', { desc = 'File explorer (edit dir like a buffer)' })

-- Highlight on yank (instant feedback while learning motions)
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.hl.on_yank() end,
})

-- ════════════════════════ PLUGINS (lazy.nvim) ════════════════════════
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  -- Colorscheme
  { 'folke/tokyonight.nvim', priority = 1000,
    config = function() vim.cmd.colorscheme('tokyonight-night') end },

  -- Git signs in the gutter
  { 'lewis6991/gitsigns.nvim', opts = {} },

  -- Shows pending keybinds — your built-in cheatsheet while learning
  { 'folke/which-key.nvim', event = 'VimEnter', opts = {} },

  -- Edit the filesystem like a buffer (replaces the VS Code sidebar)
  { 'stevearc/oil.nvim', opts = { view_options = { show_hidden = true } } },

  -- Fuzzy finder — the single biggest VS Code-parity feature
  { 'nvim-telescope/telescope.nvim', branch = 'master',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      require('telescope').setup({})
      pcall(require('telescope').load_extension, 'fzf')
      local tb = require('telescope.builtin')
      map('n', '<leader>ff', tb.find_files,  { desc = '[F]ind [F]iles (Cmd+P)' })
      map('n', '<leader>fg', tb.live_grep,   { desc = '[F]ind by [G]rep' })
      map('n', '<leader>fb', tb.buffers,     { desc = '[F]ind open [B]uffers' })
      map('n', '<leader>fh', tb.help_tags,   { desc = '[F]ind [H]elp' })
      map('n', '<leader>fd', tb.diagnostics, { desc = '[F]ind [D]iagnostics' })
      map('n', '<leader>fr', tb.resume,      { desc = '[F]ind [R]esume last' })
    end },

  -- Treesitter: real syntax understanding (highlight, indent, textobjects)
  { 'nvim-treesitter/nvim-treesitter', branch = 'master', build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'lua', 'vim', 'vimdoc', 'bash', 'fish',
          'python', 'go', 'javascript', 'typescript', 'json', 'yaml',
          'terraform', 'dockerfile', 'markdown' },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end },

  -- LSP: installer (mason) + config. Go-to-def, rename, diagnostics.
  { 'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} },   -- LSP progress spinner
    },
    config = function()
      -- Keymaps attach only when an LSP is active in the buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
          local b = function(keys, fn, desc)
            map('n', keys, fn, { buffer = ev.buf, desc = 'LSP: ' .. desc })
          end
          local tb = require('telescope.builtin')
          b('gd', tb.lsp_definitions,      '[G]oto [D]efinition')
          b('gr', tb.lsp_references,       '[G]oto [R]eferences')
          b('gI', tb.lsp_implementations,  '[G]oto [I]mplementation')
          b('<leader>rn', vim.lsp.buf.rename,      '[R]e[n]ame symbol')
          b('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          b('K', vim.lsp.buf.hover,        'Hover docs')
        end,
      })
      -- Servers to auto-install. Add as your work demands.
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'pyright', 'gopls',
          'terraformls', 'bashls', 'yamlls' },
      })
    end },

  -- Autocompletion
  { 'saghen/blink.cmp', version = '1.*',
    opts = {
      keymap = { preset = 'default' },   -- <C-y> accept, <C-n>/<C-p> navigate
      completion = { documentation = { auto_show = true } },
    } },

  -- Format on demand (not on save — stay in control while learning)
  { 'stevearc/conform.nvim',
    opts = { formatters_by_ft = { lua = { 'stylua' }, python = { 'ruff_format' } } },
    keys = { { '<leader>cf', function() require('conform').format() end, desc = '[C]ode [F]ormat' } } },

}, {})

-- vim: ts=2 sts=2 sw=2 et

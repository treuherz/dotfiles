-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- tpope
  'tpope/vim-vinegar',
  'tpope/vim-surround',
  'tpope/vim-commentary',
  'tpope/vim-repeat',
  'tpope/vim-fugitive',
  'tpope/vim-sleuth', -- change tab size based on current file
  'tpope/vim-speeddating', -- increments/decrements for dates and times

  -- colorscheme + statusline
  {
    'loctvl842/monokai-pro.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('monokai-pro').setup()
      vim.cmd.colorscheme('monokai-pro')
    end,
  },
  'itchyny/lightline.vim',

  -- treesitter + lsp
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', lazy = false },
  'neovim/nvim-lspconfig',

  -- language
  {
    'ray-x/go.nvim',
    dependencies = { 'ray-x/guihua.lua' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()',
    config = function()
      require('go').setup({
        lsp_cfg = true, -- use go.nvim's built-in gopls setup
      })
      local format_sync_grp = vim.api.nvim_create_augroup('GoFormat', { clear = true })
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.go',
        callback = function() require('go.format').goimports() end,
        group = format_sync_grp,
      })
    end,
  },
})

-- Treesitter highlighting (Neovim built-in, enabled per filetype)
-- Auto-installs missing parsers via nvim-treesitter
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter', { clear = true }),
  callback = function(ev)
    if not pcall(vim.treesitter.start) then
      local lang = vim.treesitter.language.get_lang(ev.match) or ev.match
      require('nvim-treesitter').install({ lang })
    end
  end,
})

-- General settings
vim.opt.mouse = 'a'

vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>w', '<cmd>write<CR>')

vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.nvundo')

vim.opt.background = 'dark'

vim.g.lightline = {
  colorscheme = 'molokai',
}

vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wrap = true
vim.opt.linebreak = true

-- 'Hybrid' mode
vim.opt.relativenumber = true
vim.opt.number = true

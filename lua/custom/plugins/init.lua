local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Adjust shiftwidth and expandtab base on the current file
  require 'custom.plugins.vim-sleuth',
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  require 'custom.plugins.gitsigns',
  -- Fuzzy Finder (files, lsp, etc)
  require 'custom.plugins.telescope',
  -- Lazydevh configures Lua LSP for your Neovim config, runtime and plugins used for completion, annotations and signatures of Neovim apis
  require 'custom.plugins.lazydev',
  -- LSP Config
  require 'custom.plugins.lspconfig',
  -- Autoformat
  require 'custom.plugins.conform',
  -- Autocompletion
  require 'custom.plugins.nvim-cmp',
  -- You can easily change to a different colorscheme.
  require 'custom.plugins.colorscheme',
  -- Collection of various small independent plugins/modules
  require 'custom.plugins.mini',
  -- Highlight todo, notes, etc in comments
  require 'custom.plugins.todo-comments',
  -- Treesitter
  require 'custom.plugins.treesitter',
  -- Nvim Tree file explorer
  require 'custom.plugins.nvim-tree',
  -- Git integration
  require 'custom.plugins.vim-fugitive',
  -- Copilot
  require 'custom.plugins.copilot',
  -- { 'Bilal2453/luvit-meta', lazy = true },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

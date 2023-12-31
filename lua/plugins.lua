-- Install package management.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
   })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to set `mapleader` before lazy so mappings are correct.
vim.g.mapleader = " "

require("lazy").setup({
   "tpope/vim-repeat",
   "tpope/vim-rsi",
   "tpope/vim-surround",
   "tpope/vim-unimpaired",

   -- Colorscheme --
   "dalugm/solarized.vim",
   "morhetz/gruvbox",
   -- Alias plugin names.
   { "dracula/vim", name = "dracula" },

   {
      "numToStr/Comment.nvim",
      config = function()
         require("Comment").setup()
      end,
   },

   {
      "windwp/nvim-autopairs",
      config = function()
         require("nvim-autopairs").setup()
      end,
   },

   {
      "lewis6991/gitsigns.nvim",
      config = function()
         require("gitsigns").setup({
            signs = {
               add = { text = "+" },
               change = { text = "=" },
               delete = { text = "-" },
               topdelete = { text = "‾" },
               changedelete = { text = "~" },
               untracked = { text = "?" },
            },
         })
      end,
   },
})

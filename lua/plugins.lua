local fn = vim.fn

-- Automatically install packer.
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
   PACKER_BOOTSTRAP = fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
   })
   print("Installing packer close and reopen Neovim...")
   vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file.
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use.
local status_ok, packer = pcall(require, "packer")
if not status_ok then
   return
end

return packer.startup({
   function(use)
      -- Have packer manage itself.
      use({ "wbthomason/packer.nvim" })

      use({ "tpope/vim-repeat" })
      use({ "tpope/vim-rsi" })
      use({ "tpope/vim-surround" })
      use({ "tpope/vim-unimpaired" })

      -- Colorscheme --
      use({ "dalugm/solarized.vim" })
      use({ "morhetz/gruvbox" })
      -- Alias plugin names.
      use({ "dracula/vim", as = "dracula" })

      -- Tree-sitter --
      use({
         "nvim-treesitter/nvim-treesitter",
         config = function()
            require("nvim-treesitter.configs").setup({
               ensure_installed = { "lua", "vim", "vimdoc", "query" },
               highlight = { enable = true },
               indent = { enable = true },
               rainbow = {
                  enable = true,
                  extended_mode = true,
                  max_file_lines = nil,
               },
            })
         end,
      })
      use({ "p00f/nvim-ts-rainbow" })

      use({
         "numToStr/Comment.nvim",
         config = function()
            require("Comment").setup()
         end,
      })

      use({
         "windwp/nvim-autopairs",
         config = function()
            require("nvim-autopairs").setup()
         end,
      })

      use({
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
      })

      -- Automatically set up configuration after cloning packer.nvim.
      -- Put this at the end after all plugins.
      if PACKER_BOOTSTRAP then
         require("packer").sync()
      end
   end,
   -- Configure Packer to use a floating window for command outputs.
   config = {
      display = {
         open_fn = function()
            return require("packer.util").float({ border = "single" })
         end,
      },
   },
})

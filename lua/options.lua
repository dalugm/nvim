local options = {
   -- edit --
   -- we don't need to see things like -- INSERT -- anymore
   showmode = false,

   -- Turn backup off, since we use git to manage it in most cases
   backup = false,
   writebackup = false,
   -- creates a swapfile
   swapfile = false,

   -- enable persistent undo
   undofile = true,

   -- allows neovim to access the system clipboard
   clipboard = "unnamed,unnamedplus",

   -- smart case
   smartcase = true,
   -- make indenting smarter again
   smartindent = true,

   -- the encoding written to a file
   fileencoding = "utf-8",

   -- highlight all matches on previous search pattern
   hlsearch = true,
   -- ignore case in search patterns
   ignorecase = true,

   -- enable mouse in TUI
   mouse = "a",

   -- convert tabs to spaces
   expandtab = true,
   -- the number of spaces inserted for each indentation
   shiftwidth = 4,
   -- insert 4 spaces for a tab
   tabstop = 4,
   -- number column width {default 4}
   numberwidth = 4,

   -- display lines as one long line
   wrap = false,
   -- Minimal number of screen lines around the cursor.
   scrolloff = 5,
   sidescrolloff = 5,

   -- UI --
   -- set term gui colors (most terminals support this)
   termguicolors = true,

   -- Height of the command bar
   cmdheight = 1,

   -- always show the sign column
   -- otherwise it would shift the text each time
   signcolumn = "yes",

   -- the font used in neovim GUI applications
   guifont = "LXGW WenKai Mono:h14",
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
   vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])

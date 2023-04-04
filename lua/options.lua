local options = {
   -- EDIT --
   -- We don't need to see things like -- INSERT -- anymore.
   showmode = false,

   -- Turn backup off, since we use git to manage it in most cases.
   backup = false,
   writebackup = false,
   -- Create a swapfile.
   swapfile = false,

   -- Enable persistent undo.
   undofile = true,

   -- Allow neovim to access the system clipboard.
   clipboard = "unnamed,unnamedplus",

   -- Make indenting smarter again.
   smartindent = true,

   -- The encoding written to a file.
   fileencoding = "utf-8",

   -- Highlight all matches on previous search pattern.
   hlsearch = true,
   -- Ignore case in search patterns.
   ignorecase = true,
   -- Smarter case when searching.
   smartcase = true,

   -- Enable mouse in TUI.
   mouse = "a",

   -- Convert tabs to spaces.
   expandtab = true,
   -- The number of spaces inserted for each indentation.
   shiftwidth = 4,
   -- Insert 4 spaces for a tab.
   tabstop = 4,
   -- Number column width {default 4}.
   numberwidth = 4,

   -- Display lines as one long line.
   wrap = false,
   -- Minimal number of screen lines around the cursor.
   scrolloff = 5,
   sidescrolloff = 5,

   -- UI --
   -- Set term gui colors (most terminals support this).
   termguicolors = true,

   -- Height of the command bar.
   cmdheight = 1,

   -- Always show the sign column, for debug and other plugins.
   signcolumn = "yes",

   -- Font used in neovim GUI applications.
   guifont = "LXGW WenKai Mono:h14",
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
   vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])

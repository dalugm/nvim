vim.g.mapleader = " "
vim.g.maplocalleader = ","

local options = {
   expandtab = true,
   tabstop = 8,
   softtabstop = 2,
   shiftwidth = 2,
   formatoptions = "jcroqlnt",
   completeopt = "menuone,noselect",
   ignorecase = true,
   smartcase = true,
   clipboard = "unnamedplus",
   fileformats = "unix,dos",
   number = true,
   relativenumber = true,
   signcolumn = "number",
}

for option, value in pairs(options) do
   vim.opt[option] = value
end

os.setlocale("C")
vim.g.netrw_liststyle = 3

if vim.uv.os_uname().sysname == "Windows_NT" then
   vim.o.shell = (
      ((vim.fn.executable("pwsh") == 1) and "pwsh")
      or ((vim.fn.executable("powershell") == 1) and "powershell")
      or vim.o.shell
   )
   vim.o.shellquote = ""
   vim.o.shellxquote = ""
   vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
   vim.o.shellpipe = "| Out-File -Encoding UTF8 %s"
   vim.o.shellredir = "| Out-File -Encoding UTF8 %s"
end

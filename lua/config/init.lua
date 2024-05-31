-- [nfnl] Compiled from fnl/config/init.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
vim.keymap.set("n", "<space>", "<nop>", {noremap = true})
do
  local options = {expandtab = true, tabstop = 2, shiftwidth = 2, softtabstop = 2, completeopt = "menuone,noselect", ignorecase = true, smartcase = true, clipboard = "unnamedplus", number = true, ruler = true, signcolumn = "number"}
  for option, value in pairs(options) do
    core.assoc(vim.o, option, value)
  end
end
if vim.g.neovide then
  local function set_ime(args)
    if (args.event):match("Enter$") then
      vim.g.neovide_input_ime = true
      return nil
    else
      vim.g.neovide_input_ime = false
      return nil
    end
  end
  local ime_input = vim.api.nvim_create_augroup("ime_input", {clear = true})
  vim.api.nvim_create_autocmd({"InsertEnter", "InsertLeave"}, {group = ime_input, pattern = "*", callback = set_ime})
  vim.api.nvim_create_autocmd({"CmdlineEnter", "CmdlineLeave"}, {group = ime_input, pattern = "[/\\?]", callback = set_ime})
else
end
return {}

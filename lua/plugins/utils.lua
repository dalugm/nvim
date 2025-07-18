-- [nfnl] fnl/plugins/utils.fnl
local function _1_()
  local fzf = require("fzf-lua")
  fzf.register_ui_select()
  vim.keymap.set("n", "<Leader>bb", fzf.buffers, {noremap = true, desc = "Switch buffer"})
  vim.keymap.set("n", "<LocalLeader>bb", fzf.buffers, {noremap = true, desc = "Switch buffer"})
  vim.keymap.set("n", "<C-X>b", fzf.buffers, {noremap = true, desc = "Switch buffer"})
  local function _2_()
    return fzf.files({cwd = "%:p:h"})
  end
  vim.keymap.set("n", "<LocalLeader>ff", _2_, {noremap = true, desc = "Open file browser with current buffer"})
  local function _3_()
    return fzf.files({cwd = "%:p:h"})
  end
  vim.keymap.set("n", "<Leader>fc", _3_, {noremap = true, desc = "Open file browser with current buffer"})
  vim.keymap.set("n", "<Leader>ff", fzf.files, {noremap = true, desc = "Open file browser"})
  vim.keymap.set("n", "<Leader>fr", fzf.oldfiles, {noremap = true, desc = "Recent files"})
  local function _4_()
    return fzf.files({cwd = "%:p:h"})
  end
  vim.keymap.set("n", "<C-X><C-F>", _4_, {noremap = true, desc = "Find file"})
  vim.keymap.set("n", "<Leader>gc", fzf.git_commits, {noremap = true, desc = "Git commits"})
  vim.keymap.set("n", "<Leader>gf", fzf.git_files, {noremap = true, desc = "Git files"})
  vim.keymap.set("n", "<Leader>gs", fzf.git_status, {noremap = true, desc = "Git status"})
  vim.keymap.set("n", "<Leader>gt", fzf.git_status, {noremap = true, desc = "Git status"})
  vim.keymap.set("n", "<Leader>sc", fzf.grep_cword, {noremap = true, desc = "Find string under cursor"})
  vim.keymap.set("v", "<Leader>sc", fzf.grep_visual, {noremap = true, desc = "Search selected text"})
  vim.keymap.set("n", "<Leader>sf", fzf.files, {noremap = true, desc = "Find file"})
  vim.keymap.set("n", "<Leader>sg", fzf.live_grep, {noremap = true, desc = "Grep"})
  vim.keymap.set("n", "<Leader>ss", fzf.grep_curbuf, {noremap = true, desc = "Search buffer"})
  vim.keymap.set("v", "<Leader>ss", fzf.grep_visual, {noremap = true, desc = "Search selected text"})
  vim.keymap.set("n", "<Leader>sd", fzf.zoxide, {noremap = true, desc = "Recent directories"})
  vim.keymap.set("n", "<Leader>sp", fzf.global, {noremap = true, desc = "Global pickers"})
  vim.keymap.set("n", "<LocalLeader>ss", fzf.grep_curbuf, {noremap = true, desc = "Search buffer"})
  vim.keymap.set("n", "<LocalLeader>gg", fzf.live_grep, {noremap = true, desc = "Grep"})
  vim.keymap.set("n", "<Leader>v:", fzf.commands, {noremap = true, desc = "Commands"})
  vim.keymap.set("n", "<Leader>vc", fzf.colorschemes, {noremap = true, desc = "Colorscheme"})
  vim.keymap.set("n", "<Leader>vh", fzf.helptags, {noremap = true, desc = "Help tags"})
  vim.keymap.set("n", "<Leader>vk", fzf.keymaps, {noremap = true, desc = "Keymaps"})
  vim.keymap.set("n", "<Leader>vm", fzf.marks, {noremap = true, desc = "Marks"})
  vim.keymap.set("n", "<Leader>vr", fzf.registers, {noremap = true, desc = "Registers"})
  return fzf.setup({files = {previewer = "bat"}, fzf_opts = {["--cycle"] = true}})
end
local function _5_()
  local ws = require("workspaces")
  local fzf = require("fzf-lua")
  local function _6_()
    local opts
    local function _7_(selected)
      return ws.open(selected[1])
    end
    local function _8_(selected)
      vim.cmd.tabnew()
      return ws.open(selected[1])
    end
    opts = {actions = {enter = {fn = _7_}, ["ctrl-t"] = {fn = _8_}}}
    local function _9_(cb)
      local workspace_list = ws.get()
      for _, workspace in ipairs(workspace_list) do
        cb(workspace.name)
      end
      return nil
    end
    return fzf.fzf_exec(_9_, opts)
  end
  vim.keymap.set("n", "<Leader>pp", _6_, {noremap = true, desc = "Open workspace"})
  vim.keymap.set("n", "<Leader>pa", ws.add, {noremap = true, desc = "Add workspace"})
  vim.keymap.set("n", "<Leader>pr", ws.remove, {noremap = true, desc = "Remove workspace"})
  vim.keymap.set("n", "<Leader>pl", ws.list_dirs, {noremap = true, desc = "List dirs which contain workspaces"})
  vim.keymap.set("n", "<Leader>ps", ws.sync_dirs, {noremap = true, desc = "Sync workspaces in dir"})
  return ws.setup({cd_type = "tab", hooks = {open = {"FzfLua files"}}})
end
local function _10_()
  local grug = require("grug-far")
  local ext = ((vim.bo.buftype == "") and vim.fn.expand("%:e"))
  return grug.open({prefills = {filesFilter = (((ext and (ext ~= "")) and ("*." .. ext)) or nil)}, transient = true})
end
local function _11_()
  local bd = require("mini.bufremove").delete
  if vim.bo.modified then
    local choice = vim.fn.confirm(("Save changes to " .. vim.fn.bufname() .. "?"), "&Yes\n&No\n&Cancel")
    if (choice == 1) then
      vim.cmd.write()
      return bd(0)
    elseif (choice == 2) then
      return bd(0, true)
    else
      return nil
    end
  else
    return bd(0)
  end
end
local function _14_()
  return require("mini.bufremove").delete(0, true)
end
local function _15_()
  return require("flash").jump()
end
local function _16_()
  return require("flash").jump({label = {after = {0, 0}}, pattern = "^", search = {max_length = 0, mode = "search"}})
end
local function _17_()
  return require("flash").treesitter()
end
local function _18_()
  return require("flash").remote()
end
local function _19_()
  return require("treesitter_search").remote()
end
local function _20_()
  return require("flash").toggle()
end
local function _21_()
  local wk = require("which-key")
  local function _22_()
    return require("which-key").show({global = false})
  end
  return wk.add({{"<Leader>?", _22_, desc = "Buffer local keymaps"}, {"<Leader>b", group = "Buffer"}, {"<Leader>c", group = "Code"}, {"<Leader>e", group = "Explore"}, {"<Leader>f", group = "File"}, {"<Leader>g", group = "Git"}, {"<Leader>gb", group = "Buffer"}, {"<Leader>gh", group = "Hunk"}, {"<Leader>gl", group = "Line"}, {"<Leader>l", group = "Lsp"}, {"<Leader>m", group = "Mine"}, {"<Leader>o", group = "Org"}, {"<Leader>p", group = "Project"}, {"<Leader>s", group = "Search"}, {"<Leader>t", group = "Tab"}, {"<Leader>u", group = "Undo"}, {"<Leader>v", group = "View"}})
end
return {{"ibhagwan/fzf-lua", config = _1_}, {"natecraddock/workspaces.nvim", config = _5_}, {"MagicDuck/grug-far.nvim", opts = {}, keys = {{"<Leader>sr", _10_, mode = {"n", "v"}, desc = "Search and Replace"}}}, {"kylechui/nvim-surround", event = "VeryLazy", opts = {}}, {"echasnovski/mini.align", opts = {}}, {"echasnovski/mini.bufremove", keys = {{"<Leader>bd", _11_, desc = "Delete buffer"}, {"<Leader>bD", _14_, desc = "Delete buffer (force)"}}, lazy = false}, {"echasnovski/mini.pairs", event = "VeryLazy", opts = {modes = {insert = true, command = true, terminal = false}, skip_ts = {"string"}, skip_unbalanced = true, markdown = true}}, {"folke/todo-comments.nvim", dependencies = {"nvim-lua/plenary.nvim"}, opts = {signs = false}, keys = {{"<Leader>st", "<Cmd>TodoFzfLua<CR>", mode = "n", desc = "Search todo comment"}}, lazy = false}, {"folke/flash.nvim", event = "VeryLazy", opts = {}, keys = {{"<LocalLeader>aa", _15_, mode = {"n", "o", "x"}, desc = "Flash"}, {"<LocalLeader>al", _16_, mode = {"n", "o", "x"}, desc = "Flash Line"}, {"<LocalLeader>at", _17_, mode = {"n", "o", "x"}, desc = "Flash Treesitter"}, {"<LocalLeader>ar", _18_, mode = "o", desc = "Remote Flash"}, {"<LocalLeader>as", _19_, mode = {"o", "x"}, desc = "Treesitter Search"}, {"<C-S>", _20_, mode = "c", desc = "Toggle Flash Search"}}}, {"folke/which-key.nvim", event = "VeryLazy", opts = {}, config = _21_}}

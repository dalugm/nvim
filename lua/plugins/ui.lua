-- [nfnl] Compiled from fnl/plugins/ui.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local lsp = autoload("core.lsp")
local function lsp_connection()
  local message = lsp["get-progress-message"]()
  if ((message.status == "begin") or (message.status == "report")) then
    return (message.msg .. " : " .. message.percent .. "%% \239\130\150")
  elseif (message.status == "end") then
    return "\239\131\136"
  elseif ((message.status == "") and not vim.tbl_isempty(vim.lsp.buf_get_clients(0))) then
    return "\239\131\136"
  else
    return "\239\130\150"
  end
end
local function _3_()
  local lualine = require("lualine")
  return lualine.setup({options = {theme = "auto", section_separators = "", component_separators = "", icons_enabled = false}, sections = {lualine_a = {"mode"}, lualine_b = {{"diagnostics", sections = {"error", "warn", "info", "hint"}, sources = {"nvim_lsp"}}}, lualine_c = {{"filename", file_status = true, path = 1, shorting_target = 40}}, lualine_x = {{lsp_connection}, "filesize", "encoding", "fileformat", "filetype"}, lualine_y = {{"datetime", style = "%a %R %m-%d"}}, lualine_z = {{"progress", padding = {left = 1, right = 0}}, {"location", padding = {left = 0, right = 1}}}}, inactive_sections = {lualine_a = {}, lualine_b = {}, lualine_c = {{"filename", file_status = true, path = 1}}, lualine_x = {"location"}, lualine_y = {}, lualine_z = {}}})
end
return {{"nvim-lualine/lualine.nvim", config = _3_}}
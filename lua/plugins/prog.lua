-- [nfnl] fnl/plugins/prog.fnl
local function _1_()
  vim.g["conjure#filetype#fennel"] = "conjure.client.fennel.nfnl"
  vim.g["conjure#mapping#doc_word"] = "K"
  return nil
end
local function _2_()
  return require("conform").format({async = true})
end
local function _3_()
  local cmplsp = require("cmp_nvim_lsp")
  local function _4_()
    vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true})
    vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>lh", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>ln", "<Cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>le", "<Cmd>lua vim.diagnostic.open_float()<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>lq", "<Cmd>lua vim.diagnostic.setloclist()<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>lf", "<Cmd>lua vim.lsp.buf.format()<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>la", "<Cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true})
    vim.keymap.set("v", "<Leader>la", "<Cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>ld", "<Cmd>FzfLua lsp_definitions<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>lt", "<Cmd>FzfLua lsp_typedefs<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>lx", "<Cmd>FzfLua diagnostics_document<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>lX", "<Cmd>FzfLua diagnostics_workspace<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>lr", "<Cmd>FzfLua lsp_references<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>ls", "<Cmd>FzfLua lsp_document_symbols<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>lS", "<Cmd>FzfLua lsp_workspace_symbols<CR>", {noremap = true})
    return vim.keymap.set("n", "<Leader>li", "<Cmd>FzfLua lsp_implementations<CR>", {noremap = true})
  end
  vim.api.nvim_create_autocmd("LspAttach", {callback = _4_, desc = "On LSP Attach"})
  vim.lsp.config("*", {capabilities = cmplsp.default_capabilities()})
  local vue_language_server_path = "/path/to/@vue/language-server"
  local vue_plugin = {name = "@vue/typescript-plugin", location = vue_language_server_path, languages = {"vue"}, configNamespace = "typescript"}
  vim.lsp.config("vtsls", {settings = {vtsls = {tsserver = {globalPlugins = {vue_plugin}}}}, filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue"}})
  return vim.lsp.enable({"clangd", "eslint", "gopls", "hls", "lua_ls", "ocamllsp", "rust_analyzer", "vtsls", "vue_ls", "zls"})
end
local function _5_()
  local treesitter = require("nvim-treesitter")
  local parsers = {"bash", "c", "c3", "c_sharp", "clojure", "commonlisp", "cpp", "css", "dart", "diff", "elixir", "fennel", "fsharp", "gitignore", "go", "haskell", "html", "java", "javascript", "jsdoc", "jsx", "json", "jsonc", "just", "kotlin", "lua", "make", "markdown", "markdown_inline", "nix", "ocaml", "odin", "powershell", "purescript", "python", "query", "regex", "rust", "scala", "sql", "swift", "toml", "tsx", "typescript", "typst", "vim", "vimdoc", "vue", "xml", "yaml", "zig"}
  treesitter.install(parsers)
  return treesitter.update()
end
local function _6_()
  local function _7_(args)
    local filetype = args.match
    local lang = vim.treesitter.language.get_lang(filetype)
    if vim.treesitter.language.add(lang) then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      return vim.treesitter.start()
    else
      return nil
    end
  end
  return vim.api.nvim_create_autocmd("FileType", {callback = _7_})
end
local function _9_()
  return require("treesitter-context").go_to_context(vim.v.count1)
end
return {{"Olical/conjure", ft = {"clojure", "fennel", "hy", "lua", "python"}, init = _1_}, {"hylang/vim-hy", lazy = true, ft = "hy"}, {"stevearc/conform.nvim", event = {"BufNewFile", "BufReadPre"}, keys = {{"<Leader>cf", _2_, desc = "Code format", mode = {"n", "v"}}, {"<Leader>cF", vim.cmd.ConformInfo, desc = "Code format info", mode = {"n", "v"}}}, opts = {formatters_by_ft = {["*"] = {"trim_whitespace"}, c = {"clang-format"}, clojure = {"cljfmt"}, cpp = {"clang-format"}, css = {"prettier", "eslint_d"}, dart = {"dart_format"}, go = {"gofmt"}, haskell = {"ormolu"}, html = {"prettier", "eslint_d"}, javascript = {"prettier", "eslint_d"}, ["javascript.jsx"] = {"prettier", "eslint_d"}, javascriptreact = {"prettier", "eslint_d"}, json = {"prettier", "eslint_d"}, jsonc = {"prettier", "eslint_d"}, lua = {"stylua"}, markdown = {"prettier", "eslint_d"}, nix = {"nixfmt"}, odin = {"odinfmt"}, python = {"ruff_format"}, rust = {"rustfmt"}, toml = {"taplo"}, typescript = {"prettier", "eslint_d"}, ["typescript.tsx"] = {"prettier", "eslint_d"}, typescriptreact = {"prettier", "eslint_d"}, typst = {"typstyle"}, vue = {"prettier", "eslint_d"}, zig = {"zigfmt"}}}}, {"neovim/nvim-lspconfig", event = {"BufReadPre", "BufNewFile"}, dependencies = {"hrsh7th/cmp-nvim-lsp"}, config = _3_}, {"nvim-treesitter/nvim-treesitter", branch = "main", build = {_5_, ":TSUpdate"}, init = _6_, lazy = false}, {"nvim-treesitter/nvim-treesitter-textobjects", branch = "main", opts = {}}, {"nvim-treesitter/nvim-treesitter-context", keys = {{"<Leader>cc", _9_, mode = "n", desc = "Jump to context (upwards)"}}, opts = {}, lazy = false}, {"folke/ts-comments.nvim", event = "VeryLazy", opts = {}}}

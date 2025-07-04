-- [nfnl] fnl/plugins/prog.fnl
local function _1_()
  vim.g["conjure#filetype#fennel"] = "conjure.client.fennel.nfnl"
  vim.g["conjure#mapping#doc_word"] = "K"
  return nil
end
local function _2_()
  local ft = require("flutter-tools")
  local telescope = require("telescope")
  telescope.load_extension("flutter")
  vim.keymap.set({"n", "v"}, "<Leader>mf", telescope.extensions.flutter.commands, {desc = "Flutter commands"})
  local function _3_(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>lh", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>ln", "<Cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>le", "<Cmd>lua vim.diagnostic.open_float()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>lq", "<Cmd>lua vim.diagnostic.setloclist()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>lf", "<Cmd>lua vim.lsp.buf.format()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>la", "<Cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "v", "<Leader>la", "<Cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>ld", "<Cmd>Telescope lsp_definitions<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>lt", "<Cmd>Telescope lsp_type_definitions<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>lw", "<Cmd>Telescope diagnostics<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>lr", "<Cmd>Telescope lsp_references<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>ls", "<Cmd>Telescope lsp_document_symbols<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>lS", "<Cmd>Telescope lsp_workspace_symbols<CR>", {noremap = true})
    return vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>li", "<Cmd>Telescope lsp_implementations<CR>", {noremap = true})
  end
  return ft.setup({lsp = {on_attach = _3_}})
end
local function _4_()
  return require("conform").format({async = true})
end
local function _5_()
  local cmplsp = require("cmp_nvim_lsp")
  local function _6_()
    vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true})
    vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>lh", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>ln", "<Cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>le", "<Cmd>lua vim.diagnostic.open_float()<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>lq", "<Cmd>lua vim.diagnostic.setloclist()<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>lf", "<Cmd>lua vim.lsp.buf.format()<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>la", "<Cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true})
    vim.keymap.set("v", "<Leader>la", "<Cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>ld", "<Cmd>Telescope lsp_definitions<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>lt", "<Cmd>Telescope lsp_type_definitions<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>lw", "<Cmd>Telescope diagnostics<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>lr", "<Cmd>Telescope lsp_references<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>ls", "<Cmd>Telescope lsp_document_symbols<CR>", {noremap = true})
    vim.keymap.set("n", "<Leader>lS", "<Cmd>Telescope lsp_workspace_symbols<CR>", {noremap = true})
    return vim.keymap.set("n", "<Leader>li", "<Cmd>Telescope lsp_implementations<CR>", {noremap = true})
  end
  vim.api.nvim_create_autocmd("LspAttach", {callback = _6_, desc = "On LSP Attach"})
  vim.lsp.config("*", {capabilities = cmplsp.default_capabilities()})
  vim.lsp.config("ts_ls", {init_options = {plugins = {{name = "@vue/typescript-plugin", location = "/path/to/node_modules/@vue/typescript-plugin", languages = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue"}}}}, filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue"}})
  vim.lsp.config("volar", {})
  return vim.lsp.enable({"clangd", "gopls", "hls", "ocamllsp", "rust_analyzer", "ts_ls", "vue_ls", "zls"})
end
local function _7_()
  local treesitter = require("nvim-treesitter")
  local parsers = {"bash", "c", "c3", "c_sharp", "clojure", "commonlisp", "cpp", "css", "dart", "diff", "elixir", "fennel", "fsharp", "gitignore", "go", "haskell", "html", "java", "javascript", "jsdoc", "jsx", "json", "jsonc", "just", "kotlin", "lua", "make", "markdown", "markdown_inline", "nix", "ocaml", "odin", "powershell", "purescript", "python", "query", "regex", "rust", "scala", "sql", "swift", "toml", "tsx", "typescript", "typst", "vim", "vimdoc", "vue", "xml", "yaml", "zig"}
  treesitter.install(parsers)
  return treesitter.update()
end
local function _8_()
  local function _9_(args)
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
  return vim.api.nvim_create_autocmd("FileType", {callback = _9_})
end
local function _11_()
  return require("treesitter-context").go_to_context(vim.v.count1)
end
return {{"Olical/conjure", ft = {"clojure", "fennel", "hy", "lua", "python"}, init = _1_}, {"hylang/vim-hy", lazy = true, ft = "hy"}, {"nvim-flutter/flutter-tools.nvim", dependencies = {"nvim-lua/plenary.nvim", "stevearc/dressing.nvim"}, ft = "dart", config = _2_}, {"stevearc/conform.nvim", event = {"BufNewFile", "BufReadPre"}, keys = {{"<Leader>cf", _4_, desc = "Code format", mode = {"n", "v"}}, {"<Leader>cF", vim.cmd.ConformInfo, desc = "Code format", mode = {"n", "v"}}}, opts = {formatters = {["google-java-format"] = {prepend_args = {"--aosp"}}}, formatters_by_ft = {["*"] = {"trim_whitespace"}, c = {"clang-format"}, cs = {"csharpier"}, clojure = {"cljfmt"}, cpp = {"clang-format"}, css = {"prettier"}, dart = {"dart_format"}, go = {"gofmt"}, haskell = {"ormolu"}, html = {"prettier"}, java = {"google-java-format"}, javascript = {"prettier"}, ["javascript.jsx"] = {"prettier"}, javascriptreact = {"prettier"}, json = {"prettier"}, jsonc = {"prettier"}, lua = {"stylua"}, markdown = {"prettier"}, nix = {"nixfmt"}, odin = {"odinfmt"}, python = {"ruff_format"}, rust = {"rustfmt"}, scala = {"scalafmt"}, toml = {"taplo"}, typescript = {"prettier"}, ["typescript.tsx"] = {"prettier"}, typescriptreact = {"prettier"}, typst = {"typstyle"}, vue = {"prettier"}, zig = {"zigfmt"}}}}, {"neovim/nvim-lspconfig", event = {"BufReadPre", "BufNewFile"}, dependencies = {"hrsh7th/cmp-nvim-lsp"}, config = _5_}, {"nvim-treesitter/nvim-treesitter", branch = "main", build = {_7_, ":TSUpdate"}, init = _8_, lazy = false}, {"nvim-treesitter/nvim-treesitter-textobjects", branch = "main", opts = {}}, {"nvim-treesitter/nvim-treesitter-context", keys = {{"<Leader>cc", _11_, mode = "n", desc = "Jump to context (upwards)"}}, opts = {}, lazy = false}, {"folke/ts-comments.nvim", event = "VeryLazy", opts = {}}}

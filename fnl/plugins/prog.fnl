[{1 :Olical/conjure
  :ft [:clojure :fennel :hy :lua :python]
  :init (fn []
          (set vim.g.conjure#filetype#fennel "conjure.client.fennel.nfnl")
          ; Rebind from K to <prefix>K
          (set vim.g.conjure#mapping#doc_word "K"))}

 {1 :hylang/vim-hy
  :lazy true
  :ft :hy}

 {1 :nvim-flutter/flutter-tools.nvim
  :dependencies [:nvim-lua/plenary.nvim :stevearc/dressing.nvim]
  :ft :dart
  :config #(let [ft (require :flutter-tools)
                 telescope (require :telescope)]
             (telescope.load_extension :flutter)
             (vim.keymap.set [:n :v] :<Leader>mf telescope.extensions.flutter.commands {:desc "Flutter commands"})
             (ft.setup
               {:lsp
                {:on_attach (fn [client bufnr]
                              (vim.api.nvim_buf_set_keymap bufnr :n :gd "<Cmd>lua vim.lsp.buf.definition()<CR>" {:noremap true})
                              (vim.api.nvim_buf_set_keymap bufnr :n :gD "<Cmd>lua vim.lsp.buf.declaration()<CR>" {:noremap true})
                              (vim.api.nvim_buf_set_keymap bufnr :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>" {:noremap true})
                              ; Leaderkey.
                              (vim.api.nvim_buf_set_keymap bufnr :n :<Leader>lh "<Cmd>lua vim.lsp.buf.signature_help()<CR>" {:noremap true})
                              (vim.api.nvim_buf_set_keymap bufnr :n :<Leader>ln "<Cmd>lua vim.lsp.buf.rename()<CR>" {:noremap true})
                              (vim.api.nvim_buf_set_keymap bufnr :n :<Leader>le "<Cmd>lua vim.diagnostic.open_float()<CR>" {:noremap true})
                              (vim.api.nvim_buf_set_keymap bufnr :n :<Leader>lq "<Cmd>lua vim.diagnostic.setloclist()<CR>" {:noremap true})
                              (vim.api.nvim_buf_set_keymap bufnr :n :<Leader>lf "<Cmd>lua vim.lsp.buf.format()<CR>" {:noremap true})
                              (vim.api.nvim_buf_set_keymap bufnr :n :<Leader>la "<Cmd>lua vim.lsp.buf.code_action()<CR>" {:noremap true})
                              (vim.api.nvim_buf_set_keymap bufnr :v :<Leader>la "<Cmd>lua vim.lsp.buf.code_action()<CR>" {:noremap true})
                              ; Telescope.
                              (vim.api.nvim_buf_set_keymap bufnr :n :<Leader>ld "<Cmd>Telescope lsp_definitions<CR>" {:noremap true})
                              (vim.api.nvim_buf_set_keymap bufnr :n :<Leader>lt "<Cmd>Telescope lsp_type_definitions<CR>" {:noremap true})
                              (vim.api.nvim_buf_set_keymap bufnr :n :<Leader>lw "<Cmd>Telescope diagnostics<CR>" {:noremap true})
                              (vim.api.nvim_buf_set_keymap bufnr :n :<Leader>lr "<Cmd>Telescope lsp_references<CR>" {:noremap true})
                              (vim.api.nvim_buf_set_keymap bufnr :n :<Leader>ls "<Cmd>Telescope lsp_document_symbols<CR>" {:noremap true})
                              (vim.api.nvim_buf_set_keymap bufnr :n :<Leader>lS "<Cmd>Telescope lsp_workspace_symbols<CR>" {:noremap true})
                              (vim.api.nvim_buf_set_keymap bufnr :n :<Leader>li "<Cmd>Telescope lsp_implementations<CR>" {:noremap true}))}}))}

 {1 :stevearc/conform.nvim
  :event [:BufNewFile :BufReadPre]
  :keys [{1 :<Leader>cf
          2 #((. (require :conform) :format) {:async true})
          :desc "Code format"
          :mode [:n :v]}
         {1 :<Leader>cF
          2 vim.cmd.ConformInfo
          :desc "Code format"
          :mode [:n :v]}]
  :opts {:formatters {:google-java-format {:prepend_args ["--aosp"]}}
         :formatters_by_ft {:* [:trim_whitespace]
                            :c [:clang-format]
                            :cs [:csharpier]
                            :clojure [:cljfmt]
                            :cpp [:clang-format]
                            :css [:prettier]
                            :dart [:dart_format]
                            :go [:gofmt]
                            :haskell [:ormolu]
                            :html [:prettier]
                            :java [:google-java-format]
                            :javascript [:prettier]
                            :javascript.jsx [:prettier]
                            :javascriptreact [:prettier]
                            :json [:prettier]
                            :jsonc [:prettier]
                            :lua [:stylua]
                            :markdown [:prettier]
                            :nix [:nixfmt]
                            :odin [:odinfmt]
                            :python [:ruff_format]
                            :rust [:rustfmt]
                            :scala [:scalafmt]
                            :toml [:taplo]
                            :typescript [:prettier]
                            :typescript.tsx [:prettier]
                            :typescriptreact [:prettier]
                            :typst [:typstyle]
                            :vue [:prettier]
                            :zig [:zigfmt]}}}

 {1 :neovim/nvim-lspconfig
  :event ["BufReadPre" "BufNewFile"]
  :dependencies [:hrsh7th/cmp-nvim-lsp]
  :config #(let [cmplsp (require :cmp_nvim_lsp)]
             (vim.api.nvim_create_autocmd
               :LspAttach
               {:callback
                (fn []
                  (vim.keymap.set :n :gd "<Cmd>lua vim.lsp.buf.definition()<CR>" {:noremap true})
                  (vim.keymap.set :n :gD "<Cmd>lua vim.lsp.buf.declaration()<CR>" {:noremap true})
                  ; Leaderkey.
                  (vim.keymap.set :n :<Leader>lh "<Cmd>lua vim.lsp.buf.signature_help()<CR>" {:noremap true})
                  (vim.keymap.set :n :<Leader>ln "<Cmd>lua vim.lsp.buf.rename()<CR>" {:noremap true})
                  (vim.keymap.set :n :<Leader>le "<Cmd>lua vim.diagnostic.open_float()<CR>" {:noremap true})
                  (vim.keymap.set :n :<Leader>lq "<Cmd>lua vim.diagnostic.setloclist()<CR>" {:noremap true})
                  (vim.keymap.set :n :<Leader>lf "<Cmd>lua vim.lsp.buf.format()<CR>" {:noremap true})
                  (vim.keymap.set :n :<Leader>la "<Cmd>lua vim.lsp.buf.code_action()<CR>" {:noremap true})
                  (vim.keymap.set :v :<Leader>la "<Cmd>lua vim.lsp.buf.code_action()<CR>" {:noremap true})
                  ; Telescope.
                  (vim.keymap.set :n :<Leader>ld "<Cmd>Telescope lsp_definitions<CR>" {:noremap true})
                  (vim.keymap.set :n :<Leader>lt "<Cmd>Telescope lsp_type_definitions<CR>" {:noremap true})
                  (vim.keymap.set :n :<Leader>lw "<Cmd>Telescope diagnostics<CR>" {:noremap true})
                  (vim.keymap.set :n :<Leader>lr "<Cmd>Telescope lsp_references<CR>" {:noremap true})
                  (vim.keymap.set :n :<Leader>ls "<Cmd>Telescope lsp_document_symbols<CR>" {:noremap true})
                  (vim.keymap.set :n :<Leader>lS "<Cmd>Telescope lsp_workspace_symbols<CR>" {:noremap true})
                  (vim.keymap.set :n :<Leader>li "<Cmd>Telescope lsp_implementations<CR>" {:noremap true}))
                :desc "On LSP Attach"})

             ; To add support to more language servers check:
             ; https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

             ; Default configuration for all clients.
             (vim.lsp.config :* {:capabilities (cmplsp.default_capabilities)})

             ; Typescript.
             (vim.lsp.config :ts_ls
                             {:init_options {:plugins [{:name "@vue/typescript-plugin"
                                                        :location "/path/to/node_modules/@vue/typescript-plugin"
                                                        :languages [:javascript :javascriptreact :javascript.jsx
                                                                    :typescript :typescriptreact :typescript.tsx
                                                                    :vue]}]}
                              :filetypes [:javascript :javascriptreact :javascript.jsx
                                          :typescript :typescriptreact :typescript.tsx
                                          :vue]})

             ; Vue.
             (vim.lsp.config :volar {})

             (vim.lsp.enable [:clangd
                              :gopls
                              :hls
                              :ocamllsp
                              :rust_analyzer
                              :ts_ls :vue_ls
                              :zls]))}

 {1 :nvim-treesitter/nvim-treesitter
    :lazy false
    :branch :main
    :build [#(let [treesitter (require :nvim-treesitter)
                   parsers [:bash
                            :c
                            :c3
                            :c_sharp
                            :clojure
                            :commonlisp
                            :cpp
                            :css
                            :dart
                            :diff
                            :elixir
                            :fennel
                            :fsharp
                            :gitignore
                            :go
                            :haskell
                            :html
                            :java
                            :javascript :jsdoc :jsx
                            :json :jsonc
                            :just
                            :kotlin
                            :lua
                            :make
                            :markdown :markdown_inline
                            :nix
                            :ocaml
                            :odin
                            :powershell
                            :purescript
                            :python
                            :query
                            :regex
                            :rust
                            :scala
                            :sql
                            :swift
                            :toml
                            :tsx :typescript
                            :typst
                            :vim :vimdoc
                            :vue
                            :xml
                            :yaml
                            :zig]]
               (treesitter.install parsers)
               (treesitter.update))
            ::TSUpdate]
    :init #(vim.api.nvim_create_autocmd
             :FileType
             {:callback (fn [args]
                          (local filetype args.match)
                          (local lang (vim.treesitter.language.get_lang filetype))
                          (when (vim.treesitter.language.add lang)
                            (set vim.bo.indentexpr "v:lua.require'nvim-treesitter'.indentexpr()")
                            (set vim.wo.foldexpr "v:lua.vim.treesitter.foldexpr()")
                            (vim.treesitter.start)))})}

 {1 :nvim-treesitter/nvim-treesitter-textobjects
  :branch :main
  :opts {}}

 {1 :nvim-treesitter/nvim-treesitter-context
  :lazy false
  :keys [{1 "<Leader>cc" :mode :n
          2 #((. (require :treesitter-context) :go_to_context) vim.v.count1)
          :desc "Jump to context (upwards)"}]
  :opts {}}

 {1 :folke/ts-comments.nvim
  :event :VeryLazy
  :opts {}}]

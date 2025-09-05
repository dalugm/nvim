[{1 :ibhagwan/fzf-lua
  :config #(let [fzf (require :fzf-lua)]
             (fzf.register_ui_select)

             ; Buffer.
             (vim.keymap.set :n :<Leader>bb fzf.buffers {:noremap true :desc "Switch buffer"})
             (vim.keymap.set :n :<LocalLeader>bb fzf.buffers {:noremap true :desc "Switch buffer"})
             (vim.keymap.set :n :<C-X>b fzf.buffers {:noremap true :desc "Switch buffer"})

             ; File.
             (vim.keymap.set :n :<LocalLeader>ff #(fzf.files {:cwd "%:p:h"}) {:noremap true :desc "Open file browser with current buffer"})
             (vim.keymap.set :n :<Leader>fc #(fzf.files {:cwd "%:p:h"}) {:noremap true :desc "Open file browser with current buffer"})
             (vim.keymap.set :n :<Leader>ff fzf.files {:noremap true :desc "Open file browser"})
             (vim.keymap.set :n :<Leader>fr fzf.oldfiles {:noremap true :desc "Recent files"})
             ;; Emacs style.
             (vim.keymap.set :n :<C-X><C-F> #(fzf.files {:cwd "%:p:h"}) {:noremap true :desc "Find file"})

             ; Git.
             (vim.keymap.set :n :<Leader>gc fzf.git_commits {:noremap true :desc "Git commits"})
             (vim.keymap.set :n :<Leader>gf fzf.git_files {:noremap true :desc "Git files"})
             (vim.keymap.set :n :<Leader>gs fzf.git_status {:noremap true :desc "Git status"})
             (vim.keymap.set :n :<Leader>gt fzf.git_status {:noremap true :desc "Git status"})

             ; Search.
             (vim.keymap.set :n :<Leader>sc fzf.grep_cword {:noremap true :desc "Find string under cursor"})
             (vim.keymap.set :v :<Leader>sc fzf.grep_visual {:noremap true :desc "Search selected text"})
             (vim.keymap.set :n :<Leader>sf fzf.files {:noremap true :desc "Find file"})
             (vim.keymap.set :n :<Leader>sg fzf.live_grep {:noremap true :desc "Grep"})
             (vim.keymap.set :n :<Leader>ss fzf.grep_curbuf {:noremap true :desc "Search buffer"})
             (vim.keymap.set :v :<Leader>ss fzf.grep_visual {:noremap true :desc "Search selected text"})
             (vim.keymap.set :n :<Leader>sd fzf.zoxide {:noremap true :desc "Recent directories"})
             (vim.keymap.set :n :<Leader>sp fzf.global {:noremap true :desc "Global pickers"})

             (vim.keymap.set :n :<LocalLeader>ss fzf.grep_curbuf {:noremap true :desc "Search buffer"})
             (vim.keymap.set :n :<LocalLeader>gg fzf.live_grep {:noremap true :desc "Grep"})

             ; View.
             (vim.keymap.set :n :<Leader>v: fzf.commands {:noremap true :desc "Commands"})
             (vim.keymap.set :n :<Leader>vc fzf.colorschemes {:noremap true :desc "Colorscheme"})
             (vim.keymap.set :n :<Leader>vh fzf.helptags {:noremap true :desc "Help tags"})
             (vim.keymap.set :n :<Leader>vk fzf.keymaps {:noremap true :desc "Keymaps"})
             (vim.keymap.set :n :<Leader>vm fzf.marks {:noremap true :desc "Marks"})
             (vim.keymap.set :n :<Leader>vr fzf.registers {:noremap true :desc "Registers"})

             (fzf.setup
               {:files {:previewer :bat}
                :fzf_opts {:--cycle true}}))}

 {1 :natecraddock/workspaces.nvim
  :config #(let [ws (require :workspaces)
                 fzf (require :fzf-lua)]
             (vim.keymap.set :n :<Leader>pp
                             #(let [workspace-list (ws.get)]
                                (fzf.fzf_exec
                                  (fn [cb]
                                    (each [_ workspace (ipairs workspace-list)]
                                      (cb workspace.name)))
                                  {:prompt "Workspace> "
                                   :actions {:enter {:fn (fn [selected]
                                                           (let [workspace (. selected 1)]
                                                             (ws.open workspace)))}
                                             :ctrl-t {:fn (fn [selected]
                                                            (let [workspace (. selected 1)]
                                                              (vim.cmd.tabnew)
                                                              (ws.open workspace)))}}
                                   :preview (fn [item]
                                              (let [name (. item 1)
                                                    matches (vim.tbl_filter
                                                              (fn [workspace] (= workspace.name name))
                                                              workspace-list)
                                                    matched (. matches 1)]
                                                matched.path))}))
                             {:noremap true :desc "Open workspace"})

             (vim.keymap.set :n :<Leader>pa ws.add {:noremap true :desc "Add workspace"})
             (vim.keymap.set :n :<Leader>pr ws.remove {:noremap true :desc "Remove workspace"})
             (vim.keymap.set :n :<Leader>pl ws.list_dirs {:noremap true :desc "List dirs which contain workspaces"})
             (vim.keymap.set :n :<Leader>ps ws.sync_dirs {:noremap true :desc "Sync workspaces in dir"})

             (ws.setup {:cd_type :tab
                        :hooks {:open ["FzfLua files"]}}))}

 {1 :MagicDuck/grug-far.nvim
  :opts {}
  :keys [{1 :<Leader>sr :mode [:n :v]
          2 #(let [grug (require :grug-far)
                   ext (and (= vim.bo.buftype "") (vim.fn.expand "%:e"))]
               (grug.open {:prefills {:filesFilter (or (and (and ext (not= ext ""))
                                                            (.. "*." ext))
                                                       nil)}
                           :transient true}))
          :desc "Search and Replace"}]}

 {1 :kylechui/nvim-surround
  :event :VeryLazy
  :opts {}}

 {1 :echasnovski/mini.align
  :opts {}}

 {1 :nvim-mini/mini.bufremove
  :lazy false
  :keys [{1 :<Leader>bd
          2 #(let [bd (. (require :mini.bufremove) :delete)]
               (if vim.bo.modified
                   (let [choice (vim.fn.confirm
                                  (.. "Save changes to " (vim.fn.bufname) "?")
                                  "&Yes\n&No\n&Cancel")]
                     (if
                       (= choice 1) (do (vim.cmd.write) (bd 0))
                       (= choice 2) (bd 0 true)))
                   (bd 0)))
          :desc "Delete buffer"}
         {1 :<Leader>bD
          2 #((. (require :mini.bufremove) :delete) 0 true)
          :desc "Delete buffer (force)"}]}

 {1 :nvim-mini/mini.pairs
  :event :VeryLazy
  :opts {:modes {:insert true :command true :terminal false}
         ; Skip autopair when the cursor is inside these treesitter nodes.
         :skip_ts [:string]
         ; Skip autopair when next character is closing pair and there are more
         ; closing pairs than opening pairs.
         :skip_unbalanced true
         ; Better deal with markdown code blocks.
         :markdown true}}

 {1 :folke/todo-comments.nvim
  :lazy false
  :dependencies [:nvim-lua/plenary.nvim]
  :opts {:signs false}
  :keys [{1 "<Leader>st" :mode :n
          2 :<Cmd>TodoFzfLua<CR>
          :desc "Search todo comment"}]}

 {1 :folke/flash.nvim
 :event :VeryLazy
 :opts {}
 :keys [{1 :<LocalLeader>aa :mode [:n :o :x]
         2 #((. (require :flash) :jump))
         :desc :Flash}
         {1 :<LocalLeader>al :mode [:n :o :x]
          2 #((. (require :flash) :jump) {:label {:after [0 0]}
                                          :pattern :^
                                          :search {:max_length 0 :mode :search}})
         :desc "Flash Line"}
         {1 :<LocalLeader>at :mode [:n :o :x]
          2 #((. (require :flash) :treesitter))
          :desc "Flash Treesitter"}
         {1 :<LocalLeader>ar :mode :o
          2 #((. (require :flash) :remote))
          :desc "Remote Flash"}
         {1 :<LocalLeader>as :mode [:o :x]
          2 #((. (require :treesitter_search) :remote))
          :desc "Treesitter Search"}
         {1 :<C-S> :mode :c
          2 #((. (require :flash) :toggle))
          :desc "Toggle Flash Search"}]}

 {1 :folke/which-key.nvim
  :event :VeryLazy
  :opts {}
  :config #(let [wk (require :which-key)]
             (wk.add
               [{1 :<Leader>?
                 2 #((. (require :which-key) :show) {:global false})
                 :desc "Buffer local keymaps"}
                {1 :<Leader>b :group :Buffer}
                {1 :<Leader>c :group :Code}
                {1 :<Leader>e :group :Explore}
                {1 :<Leader>f :group :File}
                {1 :<Leader>g :group :Git}
                {1 :<Leader>gb :group :Buffer}
                {1 :<Leader>gh :group :Hunk}
                {1 :<Leader>gl :group :Line}
                {1 :<Leader>l :group :Lsp}
                {1 :<Leader>m :group :Mine}
                {1 :<Leader>o :group :Org}
                {1 :<Leader>p :group :Project}
                {1 :<Leader>s :group :Search}
                {1 :<Leader>t :group :Tab}
                {1 :<Leader>u :group :Undo}
                {1 :<Leader>v :group :View}]))}]

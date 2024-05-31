(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

; space is reserved to be leader key
(vim.keymap.set :n :<space> :<nop> {:noremap true})

; sets a nvim global options
(let [options
      {; tabs is space
       :expandtab true
       ; tab/indent size
       :tabstop 2
       :shiftwidth 2
       :softtabstop 2
       ; settings needed for compe autocompletion
       :completeopt "menuone,noselect"
       ; case insensitive search
       :ignorecase true
       ; smart search case
       :smartcase true
       ; shared clipboard with linux
       :clipboard "unnamedplus"
       ; show line numbers
       :number true
       ; show line and column number
       :ruler true
       ; makes signcolumn always one column with signs and linenumber
       :signcolumn "number"}]
  (each [option value (pairs options)]
    (core.assoc vim.o option value)))

(when vim.g.neovide
  (fn set_ime [args]
    (if (args.event:match :Enter$)
      (set vim.g.neovide_input_ime true)
      (set vim.g.neovide_input_ime false)))

  (local ime_input (vim.api.nvim_create_augroup :ime_input {:clear true}))

  (vim.api.nvim_create_autocmd
    [:InsertEnter :InsertLeave]
    {:group ime_input :pattern "*" :callback set_ime})

  (vim.api.nvim_create_autocmd
    [:CmdlineEnter :CmdlineLeave]
    {:group ime_input :pattern "[/\\?]" :callback set_ime}))

{}

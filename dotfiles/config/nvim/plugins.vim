" ACK.vim 
if has('rg')
  let g:ackprg = 'rg --vimgrep'
elseif has('ag')
  let g:ackprg = 'ag'
elseif has('ack')
  let g:ackprg = 'ack'
endif

" Nuake
if has('nvim') || has('terminal')
  map <silent> <C-e> :Nuake<CR>
  map! <silent> <C-e> <Esc>:Nuake<CR>
  tmap <silent> <C-e> <C-\><C-n>:Nuake<CR>
endif

" NerdTree Git
map <silent> <leader>t :NERDTreeToggle<CR>
let g:NERDTreeGitStatusIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ "Unknown"   : "?"
      \ }

" Vista
map <silent> <leader>o :Vista!!<CR>
map! <silent> <leader>o <Esc>:Vista!!<CR>

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

let g:vista_default_executive = 'nvim_lsp'
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#icons = {
      \   "function": "\uf794",
      \   "variable": "\uf71b",
      \  }

" vim-paste-easy
let g:paste_easy_message=0

" vim-sleuth
autocmd BufReadPre,FileReadPre * :Sleuth

" Rainbow parenthesis
let g:rainbow_active = 1

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" vim-one
let g:one_allow_italics = 1

" base 16
let base16colorspace=256

" Lightline
let g:lightline = {
      \ 'colorscheme': has('nvim') ? 'tokyonight' : 'one',
      \ 'active': {
        \   'left':  [ [ 'mode', 'paste' ],
        \              [ 'gitbranch', 'readonly',  'modified',  ],
        \              [ 'relativepath' ],
        \              ['method' ]],
        \   'right': [ [ 'fileformat', 'fileencoding', 'filetype', ],
        \              [ 'lineinfo', 'percent' ]],
        \ },
        \ 'component_function': {
          \   'gitbranch': 'fugitive#head',
          \   'method': 'NearestMethodOrFunction',
        \ },
      \ }

" OSC Yank
set clipboard& clipboard^=unnamed,unnamedplus
let g:oscyank_silent = v:true
vnoremap <silent> <C-c> :OSCYank<CR>

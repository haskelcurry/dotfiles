" PLUGINS
call plug#begin(stdpath('data') . '/plugged')
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  let g:coc_global_extensions = [
    \'coc-tslint-plugin', 
    \'coc-angular', 
    \'coc-tsserver', 
    \'coc-explorer', 
    \'coc-css', 
    \'coc-html', 
    \'coc-json', 
    \'coc-prettier',
    \'coc-snippets'
  \]
  Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() } }
  Plug 'pangloss/vim-javascript'
  Plug 'mhinz/vim-startify'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'Raimondi/delimitMate'
  Plug 'cocopon/iceberg.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-fugitive'
  Plug 'shumphrey/fugitive-gitlab.vim'
  Plug 'simnalamburt/vim-mundo'
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-unimpaired'
  Plug 'caenrique/nvim-toggle-terminal'
  Plug 'olical/conjure'
  Plug 'caglartoklu/borlandp.vim'
  Plug 'letorbi/vim-colors-modern-borland'
call plug#end()

" FUNCTIONS
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    exec ':bd ' . old_file
    redraw!
  endif
endfunction

" KEYS
let mapleader="\<space>"
let maplocalleader="\<space>"
inoremap fd <esc>
nnoremap <leader>/ :Clap grep<CR>
nnoremap <leader>* :Clap grep ++query=<cword><CR>
nnoremap <leader>& :Clap grep ++query=@visual<CR>
nnoremap <leader>n :nohl<CR>
nnoremap <leader>fs :w<CR>
nnoremap <leader>ws :split<CR>
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wd <C-W>c
nnoremap <leader>wj <C-W><C-J>
nnoremap <leader>wk <C-W><C-K>
nnoremap <leader>wl <C-W><C-L>
nnoremap <leader>wh <C-W><C-H>
nnoremap <leader>wn :call coc#float#close_all()<CR>
nnoremap <leader>si :source $MYVIMRC<CR>
nnoremap <leader>bd :bp\|bd #<CR>
nnoremap <leader>ff :Clap filer<CR>
nnoremap <leader>pf :Clap files<CR>
nnoremap <leader>iy :Clap yanks<CR>
nnoremap <leader>jj :CocFix<CR>
nnoremap <leader>bb :Clap buffers<CR>
nnoremap <leader>fr :Clap history<CR>
nnoremap <leader>fR :call RenameFile()<CR>
nnoremap <leader>bo :%bd\|e#<CR>
nnoremap <leader>cs :call coc#rpc#stop()<CR>
nnoremap <leader>cr :call coc#rpc#restart()<CR>
nnoremap <F5> :MundoToggle<CR>
nnoremap <leader>gb :Gbrowse<CR>
nnoremap <leader>k :call <SID>show_documentation()<CR>
nmap <leader>0 ]f
nmap <leader>9 [f
nnoremap <leader>ss :CocSearch <C-R>=expand("<cword>")<CR><CR>
" nnoremap <leader>fD :call delete(expand('%')) | bdelete!<CR>

nmap <leader><leader> <Plug>(easymotion-overwin-f)
nnoremap <leader><tab> :b#<cr>

imap <M-/> <Plug>(coc-snippets-expand)

nnoremap mm dd
nnoremap dd "_dd
vnoremap m d
vnoremap d "_d
inoremap <expr> <C-j> pumvisible() ? "\<Down>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<Up>" : "\<C-k>"
inoremap <expr> <C-m> pumvisible() ? "\<CR>" : "\<C-m>"
vnoremap < <gv
vnoremap > >gv

nmap <leader>gd <Plug>(coc-definition)

nnoremap <leader>t :ToggleWindowTerminal<Enter>
tnoremap <leader>t <C-\><C-n>:ToggleWindowTerminal<Enter>

" UNDO
let target_path = expand('~/.config/vim-persisted-undo/')
if !isdirectory(target_path)
  call system('mkdir -p ' . target_path)
endif
let &undodir = target_path
set undofile

" CLAP
let g:clap_project_root_marker = ['package.json', '.git', '.git/']
let g:clap_layout = {'relative': 'editor'}
let g:clap_preview_direction = 'UD'
autocmd FileType clap_input inoremap <silent> <buffer> <C-h> <C-R>=clap#handler#bs_action()<CR>
autocmd FileType clap_input inoremap <silent> <buffer> <C-l> <C-R>=clap#handler#tab_action()<CR>
autocmd FileType clap_input inoremap <silent> <buffer> <esc> <esc>:call clap#handler#exit()<CR>

" CONJURE
:let g:conjure#mapping#prefix = "<leader>"

" OTHER TWEAKS
:autocmd InsertEnter * set timeoutlen=200
:autocmd InsertLeave * set timeoutlen=1000
let g:fugitive_gitlab_domains = ['https://git.cgm.ag']
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
  \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

autocmd BufReadPost * 
  \ cd ~

" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" SETTINGS
set tabstop=2
set shiftwidth=2
set expandtab
set number
set hidden
set autoread
set autochdir
set wildmode=list:longest
set inccommand=nosplit
set clipboard+=unnamedplus
set cursorline
set ignorecase
set smartcase
set termguicolors
let g:BorlandStyle = "classic"
color iceberg
hi Search cterm=NONE ctermbg=yellow ctermfg=black

" coc
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=number
nmap <silent> dp <Plug>(coc-diagnostic-prev)
nmap <silent> dn <Plug>(coc-diagnostic-next)
nmap <silent> <leader>dd :CocDiagnostics<CR>

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:lightline = {
\ 'colorscheme': 'PaperColor',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': {
\   'cocstatus': 'coc#status'
\ },
\ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

let g:coc_node_args = ['--max-old-space-size=6000']

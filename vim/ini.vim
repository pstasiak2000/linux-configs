
"
" Configuring line breaks
set wrap
set linebreak
set textwidth=0
set wrapmargin=0
set tabstop=4
set shiftwidth=4
 
" Plugin directory is optional
call plug#begin()

" Declare the list of plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'ap/vim-css-color'
Plug 'rstacruz/vim-closer'

Plug 'terryma/vim-smooth-scroll'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-janah'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"For LaTeX development
Plug 'lervag/vimtex'
Plug 'ryanoasis/vim-devicons'

"Julia syntex highlighting
Plug 'JuliaEditorSupport/julia-vim'
set encoding=UTF-8

call plug#end()

autocmd ColorScheme janah highlight Normal ctermbg=235
colorscheme janah

" Automatically launch NerdTree when entering vim
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | end

filetype plugin indent on
syntax enable


let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@ter'

let g:WebDevIconsUnicodeDecorateFileNodes = 1
"let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsEnableNERDTreeGlyphPalette = 1

autocmd VimEnter * call extend(g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols, {
\ 'tar': '',
\ 'gz': '',
\ 'xz': '',
\ 'zip': '',
\ 'docx': '',
\ 'tex': '',
\ 'bib': '󰆧',
\ 'pdf': '',
\ 'cfg': '', 
\ 'mp4': '',
\ 'mp3': '󱑽',
\ 'wav': '󱑽',
\ 'm': '',
\ 'f90': ''
\ }) | NERDTreeRefreshRoot



" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes


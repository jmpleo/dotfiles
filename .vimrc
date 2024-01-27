set encoding=utf8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Preamble                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

" Needed for vundle, will be turned on after vundle inits
filetype off

" Setting up Vundle if there is none
if !filereadable(expand('$HOME/.vim/bundle/Vundle.vim/README.md'))
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone --quiet https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
endif

" Setup vundle
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin('$HOME/.vim/bundle')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Vundle configuration                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" These need to come before the confiuration options for the plugins since
" vundle will add the plugin folders to the runtimepath only after it has seen
" the plugin's Plugin command.
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Vundle
Plugin 'gmarik/Vundle.vim'

" Startify
Plugin 'mhinz/vim-startify'                  " Start screen for vim

" Tabs and buffers
Plugin 'mkitt/tabline.vim'                   " Configure tab labels within vim with a very succinct output
Plugin 'Asheq/close-buffers.vim'

" Appearance, colors, icons
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'              " One stop shop for vim colorschemes
Plugin 'bling/vim-airline'                   " Lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline-themes'      " Themes for vim-airline plugin
Plugin 'ryanoasis/vim-devicons'              " Enble fancy icons in vim
Plugin 'tribela/vim-transparent'

" Surround
Plugin 'tpope/vim-surround'                  " All about surroundings: parentheses, brackets, quotes, XML tags, and more

" Comments
Plugin 'tpope/vim-commentary'                " Comment stuff in and out

" Syntax check
Plugin 'vim-syntastic/syntastic'             " Syntax checking plugin for Vim

" Indentation
Plugin 'yggdroot/indentline'                 " Display thin vertical lines at each indentation level

" Navigation
Plugin 'ctrlpvim/ctrlp.vim'                  " Full path fuzzy file, buffer, mru, tag, ... finder for Vim
Plugin 'scrooloose/nerdtree'                 " File system explorer for vim
Plugin 'majutsushi/tagbar'                   " Browse the tags of the file and get an overview of its structure

" C++
Plugin 'a.vim'                               " Alternate files quickly (.c <--> .h etc) via :A
Plugin 'octol/vim-cpp-enhanced-highlight'    " Advanced highlighting of C++ code

"
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

Plugin 'lifepillar/pgsql.vim'

" NASM
Plugin 'DanSnow/nasm-indent.vim'

" JS
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Python
 " Plugin 'klen/python-mode'                    " Vim python-mode. PyLint, Rope, PyDoc, breakpoints from box
 " Plugin 'vim-scripts/indentpython.vim'
 " Plugin 'davidhalter/jedi-vim'

" Git
Plugin 'tpope/vim-fugitive'                  " Git plugin for Vim. So awesome, it should be illegal
Plugin 'Xuyuanp/nerdtree-git-plugin'         " A plugin of NERDTree showing git status flags.
Plugin 'airblade/vim-gitgutter'              " A Vim plugin which shows a git diff in the sign column

call vundle#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           reset vimrc augroup                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" We reset the vimrc augroup. Autocommands are added to this group throughout
" the file
augroup vimrc
  autocmd!
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        turn on filetype plugins                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable detection, plugins and indenting in one step
" This needs to come AFTER the Plugin commands!
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        *** General settings ***                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Choose colorschema                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if filereadable(expand('$HOME/.vim/bundle/vim-colorschemes/README.md'))
    " Default dark scheme
    " colorscheme Tomorrow-Night
    colorscheme gruvbox
    " colorscheme nordisk
    " colorscheme solarized

    " Default light scheme
    " colorscheme PaperColor " sets the colorscheme

    set background=dark
    "set background=light
endif

" Adjust highlighting colors

hi Error ctermfg=160 ctermbg=NONE
hi ErrorMsg ctermfg=160 ctermbg=NONE
hi SpellBad ctermbg=85 gui=undercurl guisp=Red

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                HJKL                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make good habit
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>

" Enable mouse
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            BUFFERS                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autochdir           " Automatically change directory on buffer change
set hidden              " Allows making buffers hidden even with unsaved changes
set switchbuf=useopen,usetab  " This option controls the behavior when switching between buffers
set diffopt+=vertical   " Split buffers vertically in diff mode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            DISPLAY SETTINGS                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set scrolloff=5         " 5 lines above/below cursor when scrolling
set showmatch           " show matching bracket (briefly jump)
set matchtime=2         " reduces matching paren blink time from the 5[00]ms def
set cursorline          " highlights the current line
set winaltkeys=no       " turns of the Alt key bindings to the gui menu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            EDITOR SETTINGS                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nowrap              " Don't wrap lines longer than window width
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters
" this can cause problems with other filetypes
" see comment on this SO question
" http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim/234578#234578
set tabstop=4           " number of spaces a tab counts for
set shiftwidth=4        " spaces for autoindents
set expandtab           " turn a tab into spaces
set smartindent         " smart auto indenting
set autoindent          " on new lines, match indent of previous line
set copyindent          " copy the previous indentation on autoindenting
set cindent             " smart indenting for c-like code
set cino=b1,g0,N-s,t0,W0  " see :h cinoptions-values
set smarttab            " smart tab handling for indenting
set magic               " change the way backslashes are used in search patterns
set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set nobackup            " no backup~ files.

set softtabstop=2       " Number of spaces that a <Tab> counts for while performing editing operations
set shiftround          " makes indenting a multiple of shiftwidth
set laststatus=2        " the statusline is now always shown

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Json                                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vim_json_conceal = 0

au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           TeX                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tex_conceal = ""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Misc settings                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set fileformat=unix     " file mode is unix
set fileformats=unix,dos,mac   " detects unix, dos, mac file formats in that order
set noswapfile          " do not store swap files

set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'

set history=10000       " remember more commands and search history
set undolevels=10000    " use many levels of undo
set autoread            " auto read when a file is changed from the outside
set foldlevelstart=99   " all folds open by default

" this makes sure that shell scripts are highlighted
" as bash scripts and not sh scripts
let g:is_posix = 1

" tries to avoid those annoying "hit enter to continue" messages
" if it still doesn't help with certain commands, add a second <cr>
" at the end of the map command
set shortmess+=T

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Navigation                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" none of these should be word dividers, so make them not be
set iskeyword-=_,$,@,%,#

" allow backspace and cursor keys to cross line boundaries
set whichwrap+=<,>,h,l,[,]
set hlsearch            " highlight all search results
set incsearch           " highlight-as-I-type the search string
set shortmess-=S        " show the current match position

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Appearance                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set textwidth=80            " this makes the color after the textwidth column highlighted
set colorcolumn=+1          " comma separated list of screen columns that are highlighted with ColorColumn
set formatoptions=croqnj    " options for formatting text; see :h formatoptions
set splitright              " Open splits to the right
set number                  " Lines enumeration
set list                    " Highlight uwanted spaces, nice for tsv files viewing
set listchars=trail:·,tab:→→
set shell=/bin/bash         " set shell to use in :terminal

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Typos                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab itn int

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Tweaks                                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Unicode support (taken from http://vim.wikia.com/wiki/Working_with_Unicode)
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif

" The new Vim regex engine is currently slooooow as hell which makes syntax
" highlighting slow, which introduces typing latency.
" Consider removing this in the future when the new regex engine becomes
" faster.
if v:version >= 704
  set regexpengine=1
endif

" Automatically delete trailing DOS-returns and whitespace on file open and write.
augroup vimrc
  autocmd BufRead,BufWritePre,FileWritePre * silent! %s/[\r \t]\+$//
augroup END

" Sometimes, $MYVIMRC does not get set even though the vimrc is sourced
" properly. So far, I've only seen this on Linux machines on rare occasions.
if has("unix") && strlen($MYVIMRC) < 1
  let $MYVIMRC=$HOME . '/.vimrc'
endif

" Automatically close Quickfix window if it is the last one.
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" cindent is a bit too smart for its own good and triggers in text files when
" you're typing inside parens and then hit enter; it aligns the text with the
" opening paren and we do NOT want this in text files!
autocmd vimrc FileType tex,text,markdown,gitcommit setlocal nocindent

" By default check English spelling in markdown files
autocmd vimrc FileType markdown setlocal spell! spelllang=en_us

" Remember the last position of when the file was closed
if has("autocmd")
  augroup redhat
  autocmd!
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  augroup END
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Custom mappings                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" this makes vim's regex engine "not stupid"
" see :h magic
" nnoremap / /\v
" vnoremap / /\v

" Allow Tab & Shift-Tab indentation in /normal and/ visual modes
vnoremap <Tab> >
vnoremap <S-Tab> <
nnoremap <Tab> >>
nnoremap <S-Tab> <<

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" press jj to normal mode
inoremap jj <ESC>

" Nerd tree on F4
map <F4> :NERDTreeToggle<CR>
map! <F4> <C-o><F4>

" Switch between buffers on F7 and F8
map <silent> <F7> :bp<CR>
map! <F7> <C-o><F7>
map <silent> <F8> :bn<CR>
map! <F8> <C-o><F8>

" Tagbar on F9
map <F9> :TagbarToggle<CR>
map! <F9> <C-o><F9>
"let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_ctags_bin = 'ctags'
" replace visual selection (https://stackoverflow.com/a/676619/3066429)
" By pressing ctrl+r in visual mode, you will be prompted to enter text to replace with.
" Press enter and then confirm each change you agree with y or decline with n.
" This command will override your register h so you can choose other one (by changing h in
" the command above to another lower case letter) that you don't use.
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       ***  HERE BE PLUGINS  ***                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Vundle                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vundle_default_git_proto = 'git'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Tagbar                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tagbar_autoclose = 0
let g:tagbar_autofocus = 0
let g:tagbar_width = 35

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             vim-startify                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:startify_bookmarks = [ '~/.vimrc' ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             vim-commentary                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType cmake setlocal commentstring=#\ %s

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             tabline.vim                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tablineclosebutton=1

hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             scrooloose/nerdtree                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDTreeShowHidden=1
let g:NERDTreeGitStatusUpdateOnWrite = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeGitStatusNodeColorization = 1

" Specific colors for NERDTree git symbols
let g:NERDTreeColorMapCustom = {
\ "Staged"    : "#0ee375",
\ "Modified"  : "#d9bf91",
\ "Renamed"   : "#51C9FC",
\ "Untracked" : "#FCE77C",
\ "Unmerged"  : "#FC51E6",
\ "Dirty"     : "#FFBD61",
\ "Clean"     : "#87939A",
\ "Ignored"   : "#808080"
\ }

" Specific NERDTree git symbols
let g:NERDTreeGitStatusIndicatorMapCustom = {
\ 'Modified'  :'✹',
\ 'Staged'    :'✚',
\ 'Untracked' :'✭',
\ 'Renamed'   :'➜',
\ 'Unmerged'  :'═',
\ 'Deleted'   :'✖',
\ 'Dirty'     :'✗',
\ 'Ignored'   :'☒',
\ 'Clean'     :'✔︎',
\ 'Unknown'   :'?',
\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                vim-devicons                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" loading the plugin
let g:webdevicons_enable = 1
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
" ctrlp glyphs
let g:webdevicons_enable_ctrlp = 1
" adding to vim-startify screen
let g:webdevicons_enable_startify = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                vim-airline                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always display statusline
" Fancy theme. Requires vim-airline-themes
let g:airline_theme = 'distinguished' " 'angr'

" Use fancy symbols
let g:airline_powerline_fonts = 1
" Setup dictionary for the symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

syntax on

" Unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" Powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

" Setup interaction with other plugins
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#capslock#enabled = 1
let g:airline#extensions#tabline#enabled = 1
" Setup interaction with other plugins
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#capslock#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" add date and time to statusline
au User AirlineAfterInit  :let g:airline_section_z = airline#section#create([
\   '%p%% Ln %l/%L Col %v | %{strftime("%-d %b %Y %H:%M:%S")}'
\])
" force status line update, to see current time
:call timer_start(1000, {-> execute(':let &stl=&stl')}, {'repeat': -1})


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             vim-cpp-enhanced-highlight                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight class scope
let g:cpp_class_scope_highlight = 1

" Highlight member variables
let g:cpp_member_variable_highlight = 1

" Highlight class names in declarations
let g:cpp_class_decl_highlight = 1

" Highlight POSIX functions
let g:cpp_posix_standard = 1

" Highlight template functions (slow but more precise)
let g:cpp_experimental_simple_template_highlight = 1

" Highlight template functions (fast but less precise)
" let g:cpp_experimental_template_highlight = 1

" Highlight of library concepts
let g:cpp_concepts_highlight = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

let g:jsx_ext_required = 1
let g:jsx_pragma_required = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              python-mode                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:pymode_lint_checkers = {}
let g:pymode_options_max_line_length=80
let g:pymode_python = 'python3'

let g:jedi#auto_initialization = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              syntastic                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              black                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify the virtual environment path for black
"let g:black_virtualenv='~/.vim/auxiliary/black'
"let g:black_linelength = 80
" Run black on save
"autocmd BufWritePre *.py execute ':Black'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             ctrlp.vim                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_depth=40
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             indentline                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:indentLine_enabled = 1

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" verbose imap <TAB>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.



inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"    \ pumvisible() ? "\<C-n>" :
"    \ <SID>check_back_space() ? "\<TAB>" :
"    \ coc#refresh()
inoremap<expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" Postgresql
let g:sql_type_default = 'pgsql'



" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)                          
call plug#begin('~/.vim/plugged')
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" 可以快速对齐的插件
Plug 'junegunn/vim-easy-align'

" 用来提供一个导航目录的侧边栏
Plug 'scrooloose/nerdtree'

" 可以使 nerdtree 的 tab 更加友好些
Plug 'jistr/vim-nerdtree-tabs'

" 可以在导航目录中看到 git 版本信息
Plug 'Xuyuanp/nerdtree-git-plugin'

" 查看当前代码文件中的变量和函数列表的插件，
" 可以切换和跳转到代码中对应的变量和函数的位置
" 大纲式导航, Go 需要 https://github.com/jstemmer/gotags 支持
Plug 'majutsushi/tagbar'

" 自动补全括号的插件，包括小括号，中括号，以及花括号
Plug 'jiangmiao/auto-pairs'

" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
Plug 'vim-airline/vim-airline'

" 有道词典在线翻译
Plug 'ianva/vim-youdao-translater'

" 代码自动完成，安装完插件还需要额外配置才可以使用
Plug 'Valloric/YouCompleteMe'

" 可以在文档中显示 git 信息
" Plug 'airblade/vim-gitgutter'

" 下面两个插件要配合使用，可以自动生成代码块
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" 可以在 vim 中使用 tab 补全
"Plug 'vim-scripts/SuperTab'

" 可以在 vim 中自动完成
"Plug 'Shougo/neocomplete.vim'
" go 主要插件
Plug 'fatih/vim-go', { 'tag': '*' }
" go 中的代码追踪，输入 gd 就可以自动跳转
Plug 'dgryski/vim-godef'

" markdown 插件
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
map <F8> :NERDTreeToggle<CR>
let g:NERDTreeIndicatorMapCustom = {
	\"Modified"   : "M",
	\ "Staged"    : "+",
	\ "Untracked" : "U",
	\ "Renamed"   : "R",
	\ "Unmerged"  : "=",
	\ "Deleted"   : "D",
	\ "Dirty"     : "X",
	\ "Clean"     : "N", 
	\ "Unknown"   : "?"    
	\}
call plug#end()

let g:neocomplcache_enable_at_startup = 1 
let g:neocomplcache_enable_smart_case = 1 
inoremap <expr><TAB> pumvisible()?"\<C-n>" : "\<TAB>"
"默認開啟NERDTree
"autocmd VimEnter * NERDTree
"顯示TreeBookmarks
let NERDTreeShowBookmarks=1

set backup
set nu
set cursorline " 啟用游標提示
set tabstop=4 " Tab所需的空白字元數
set shiftwidth=4 "縮排所需的空白鍵位元數
set ai " 自動縮排 複製貼上可能會有問題 可使用:set paste
set incsearch "即時搜尋
" Color configuration
set t_Co=256 "設定最支援256色
set hlsearch "搜尋Highlight
" set bg=dark " 暗色背景模式
set history=500
"貼上開關
set pastetoggle=<F12>

"color evening  " Same as :colorscheme evening
colorscheme molokai"顏色主題

hi LineNr cterm=bold ctermfg=NONE ctermbg=NONE
hi CursorLineNr cterm=bold ctermfg=NONE ctermbg=NONE
hi Search cterm=reverse ctermbg=none ctermfg=none
" 按下F4開關行號
map <F4> : set nu!<BAR>set nonu?<CR>

"#######################################################
"" encode
if has("multi_byte")
	 set fileencodings=utf-8,utf-16,big5,gb2312,gbk,gb18030,euc-jp,euc-kr,latin1
else
	 echoerr "If +multi_byte is not included, you should compile Vim with big features."
endif
" Toggle mouse
map <C-n> :call SwitchMouseMode()<CR>
map! <C-n> <Esc>:call SwitchMouseMode()<CR>
function SwitchMouseMode()
    if (&mouse == "a")
        let &mouse = ""
        echo "Mouse is disabled."
    else
        let &mouse = "a"
        echo "Mouse is enabled."
    endif
endfunction
" Toggle text/binary
" < ctrl + b >來切換文字/二進制模式
map <C-b> :call SwitchTextBinaryMode()<CR>
map! <C-b> <Esc>:call SwitchTextBinaryMode()<CR>
function SwitchTextBinaryMode()
    if (&binary == 0)
        set binary
        set noeol
        echo "Switch to binary mode."
    else
        set nobinary
        set eol
        echo "Switch to text mode."
    endif
endfunction

" To utf-8 file
"< Ctrl + J > 強制將目前開啟的文件轉成UTF-8編碼
map <C-j> :call ToUTF8()<CR>
map! <C-j> <Esc>:call ToUTF8()<CR>
function ToUTF8()
    if (&fileencoding == "utf-8")
        echo "It is already UTF-8."
    else
        let &fileencoding="utf-8"
        echo "Convert to UTF-8."
    endif
    let &ff="unix"
endfunction

" Convert tab to spaces 
" < Ctrl + t > 將TAB轉換成空格
map <C-p> :call TabToSpaces()<CR>
map! <C-p> <Esc>:call TabToSpaces()<CR>
function TabToSpaces()
    retab
    echo "Convert tab to spaces."
endfunction
" Toggle line breaking
" < Ctrl + L > 來切換自動斷行模式
map <C-l> :call SwitchLineBreakingMode()<CR>
map! <C-l> <Esc>:call SwitchLineBreakingMode()<CR>
function SwitchLineBreakingMode()
    if (&wrap == 0)
        set wrap
        echo "Switch to line breaking mode."
    else
        set nowrap
        echo "Switch to one line mode."
    endif
endfunction
" ctag
"map <f9> :Tlist<CR>
nmap <F9> :TagbarToggle<CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


" clang
" map to <Leader>cf in C++ code
"autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
"autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
"autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
"nmap <Leader>C :ClangFormatAutoToggle<CR>
let g:clang_format#command = 'clang-format'
nmap <F2> :ClangFormat<cr>
autocmd FileType c ClangFormatAutoEnable
let g:clang_format#detect_style_file = 1
syntax enable
syntax on                    " 开启文件类型侦测
filetype plugin indent on    " 启用自动补全

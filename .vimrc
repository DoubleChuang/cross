" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)                          
call plug#begin('~/.vim/plugged')

Plug 'Shougo/neocomplcache'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
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
map <f9> :Tlist<CR>

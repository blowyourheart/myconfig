set nocompatible
set number
syntax on
color evening
set nobackup
set confirm " 用确认对话框（对于 gvim）或命令行选项（对于 " vim）来代替有未保存内容时的警告信息
set mouse=a " 设定在可视模式下鼠标可用,方便复制
set autowrite
set hidden
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab "expand tab to whitespaces
set smarttab " use tabs at the start of a line, spaces elsewhere
set noignorecase " 默认区分大小写
set nolinebreak " 在单词中间断行
set showcmd " 在状态栏显示目前所执行的指令，未完成的指令片段亦会显示出来
set fileencodings=utf-8,gbk
set fileencoding=utf-8
set termencoding=utf-8
set encoding=utf-8
set guifont=Courier\ 10\ Pitch\ 12
set fileformat=unix "unix|doc|mac

set cindent
set autoindent
set wrap
set formatoptions=qrn1

"set control character to be other chars
set nolist
set listchars=tab:▸\ ,eol:¬

set visualbell
set ttyfast
set nohlsearch
set incsearch
set hlsearch
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时  仍保持对大小写敏感
set showmatch
"set gdefault "默认在一行上进行全局替换
set background=dark
set textwidth=80 "设置行宽为80个字符，超过会自动换行
set ruler " 打开状态栏标尺
set rulerformat=%15(%c%V\ %p%%%)
set backspace=2
set showmode
set modelines=0
set scrolloff=3
if version >= 703
  set undofile "undofile tells Vim to create <FILENAME>.un~ files whenever you edit a file.
endif
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=%F%m%r\ \|\ %Y,%{&fileencoding}\ \|%=\ /%L,%c\ \|\ %b\ %B\|%p
" 设置在状态行显示的信息如下：
" " %f 当前的文件名
" " %F 当前全路径文件名
" " %m 当前文件修改状态
" " %r 当前文件是否只读
" " %Y 当前文件类型
" " %{&fileformat}
" " 当前文件编码
" " %{&fileencoding}
" " 中文编码
" " %b 当前光标处字符的 ASCII 码值
" " %B 当前光标处字符的十六进制值
" " %l 当前光标行号
" " %c 当前光标列号
" " %V 当前光标虚拟列号 (根据字符所占字节数计算)
" " %p 当前行占总行数的百分比
" " %% 百分号
" " %L 当前文件总行数

let mapleader = "," "chang leader to ,
" nnoremap / /\v
" vnoremap / /\v
"erase hlsearch result
nnoremap <leader><space> :noh<cr>
"strip all trailing whitespace of every line in the current file
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>
"forbid F1 to help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

set path+=/usr/include/c++/4.4
" set path+=/home/wangq/jike/coding 添加svn目录到路径变量中，可以快速查看某一个文件到内容
if stridx(getcwd(), 'jike/branches/sentiment-dev') >= 0
  set path+=/home/wangq/jike/branches/sentiment-dev "添加svn目录到路径变量中，可以快速查看某一个文件到内容
  set path+=/home/wangq/jike/branches/sentiment-dev/.ymake-out/dbg/thrift-out "thrift
  " 在svn根目录下生成tag文件会很慢，直接忽略掉
  " set tags=/home/wangq/jike/branches/sentiment-dev/**/tags "sentiment 的tag文件，包含所有到子目录tag，以后可以用Ctrl+]来跳转了。
elseif stridx(getcwd(), 'jike/newproduct-coding') >= 0
  set path+=/home/wangq/jike/newproduct-coding " 添加svn目录到路径变量中，可以快速查看某一个文件到内容
  set path+=/home/wangq/jike/newproduct-coding/.ymake-out/dbg/thrift-out "thrift
  " 在svn根目录下生成tag文件会很慢，直接忽略掉,只使用base,和bi/social_mining下的tags
  "set tags+=/home/wangq/jike/newproduct-coding/base/tags "newproduct-coding 的tag文件，以后可以用Ctrl+]来跳转了。
  "set tags+=/home/wangq/jike/newproduct-coding/bi/social_mining/tags
  "set tags+=/home/wangq/jike/newproduct-coding/sentiment/weibo/tags
elseif stridx(getcwd(), 'jike/newproduct-trunk') >= 0
  set path+=/home/wangq/jike/newproduct-trunk" 添加svn目录到路径变量中，可以快速查看某一个文件到内容
  set path+=/home/wangq/jike/newproduct-trunk/.ymake-out/dbg/thrift-out "thrift
  " 在svn根目录下生成tag文件会很慢，直接忽略掉,只使用base,和bi/social_mining下的tags
  "set tags+=/home/wangq/jike/newproduct-coding/base/tags "newproduct-coding 的tag文件，以后可以用Ctrl+]来跳转了。
  "set tags+=/home/wangq/jike/newproduct-coding/bi/social_mining/tags
  "set tags+=/home/wangq/jike/newproduct-coding/sentiment/weibo/tags
elseif stridx(getcwd(), 'jike/coding') >= 0
  set path+=/home/wangq/jike/coding " 添加svn目录到路径变量中，可以快速查看某一个文件到内容
  set path+=/home/wangq/jike/coding/.ymake-out/dbg/thrift-out "thrift
endif

" the viminfo struct
set viminfo='1000,f1,:100,/100,%,!

" When editing a file, always jump to the last cursor position.
" " This must be after the uncompress commands.
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif 


" #################################################################
" set omnicppcomplete options
" 设置tags 文件的生成方法
" map <F5> :!ctags -R --languages=c++ -I --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
" imap <F5> <ESC>:!ctags -R --languages=c++ -I --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>

"-- omnicppcomplete setting --
" 按下F3自动补全代码，注意该映射语句后不能有其他字符，包括tab；否则按下F3会自动补全一些乱码
imap <F3> <C-X><C-O>
" 按下F2根据头文件内关键字补全
imap <F2> <C-X><C-I>
set completeopt=menu,menuone "关掉智能补全时的预览窗口

let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete with ::

let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
let OmniCpp_DisplayMode=0 " Class scope completion mode: auto decided by script
"let OmniCpp_DefaultNamespaces=["std", "base"] " auto search std and base namespace members
let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1 

" #################################################################
" omnicppcomplete options done


filetype on "detect the type of file
filetype plugin on "load filetype plugins,


"-- Taglist setting --
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=1 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0
"让taglist可以同时展示多个文件的函数列表
let Tlist_File_Fold_Auto_Close=1
"非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1
"当taglist是最后一个分割窗口时，自动推出vim
"是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=1 "实时更新tags
let Tlist_Inc_Winwidth=0

"-- WinManager setting --
let g:winManagerWindowLayout='FileExplorer|TagList' " 设置我们要管理的插件
let g:persistentBehaviour=0 " 如果所有编辑文件都关闭了，退出vim
nnoremap wm :WMToggle<cr> 

" -- MiniBufferExplorer --
let g:miniBufExplMapWindowNavVim=1 "按下Ctrl+h/j/k/l，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapCTabSwitchBufs = 1  "启用以下两个功能：Ctrl+tab移到下一个buffer并在当前窗口打开；Ctrl+Shift+tab移到上一个buffer并在当前窗口打开；ubuntu好像不支持
let g:miniBufExplMapCTabSwitchWindows = 1 "启用以下两个功能：Ctrl+tab移到下一个窗口；Ctrl+Shift+tab移到上一个窗口；ubuntu好像不支持
let g:miniBufExplModSelTarget = 1   "不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer

"--fold setting-- 不好用，直接关闭掉
"set foldmethod=syntax " 用语法高亮来定义折叠
"set foldlevel=100 启动vim时不要自动折叠代码
"set foldcolumn=2 " 设置折叠栏宽度

" common key binding
noremap <C-left> <esc>:bp<cr>
noremap <C-right> <esc>:bn<cr>
" autocmd filetype c,cpp set makeprg=ymake
autocmd filetype c,cpp map <buffer> <C-F5>	<esc>:w<cr>:!ymake<cr>
"binding compile key to be used in putty mode since putty cannot use <C-F5>
autocmd filetype  python map <buffer> <C-F5>	<esc>:!python %<cr>
autocmd filetype  sh map <buffer> <C-F5>	<esc>:!sh %<cr>
noremap <F12> <esc>:source ~/.vimrc<cr>
imap <C-c> <esc>:call ToggleCommentCurrentLine()<cr>
nmap <C-c> :call ToggleCommentCurrentLine()<cr>
autocmd filetype c,cpp,java nmap <buffer> ;b :call CommentBlock()<cr>
nmap <C-M-Down> ddpk<cr>
nmap <C-M-Up> :call MoveUpSingleLine()<cr>k

let g:indent_guides_guide_size=1
"高亮当前行
" set cursorline
""set cursorcolumn
" hi CursorLine   cterm=NONE ctermbg=Grey ctermfg=darkblue guibg=Grey20 guifg=darkblue
" hi CursorColumn cterm=NONE ctermbg=Grey ctermfg=darkblue guibg=Grey20 guifg=darkblue
if version >= 703
  autocmd BufNewFile,BufRead *.h,*.c,*.cc,*.cpp,*.py,*YBUILD,*.sh set colorcolumn=80
endif

au BufNewFile,BufRead *.thrift setf cpp
au BufNewFile,BufRead *YBUILD setf python 

nnoremap <buffer> <F9> :call ToggleMouseMode()<cr>
function! ToggleMouseMode()
  if &mouse ==? 'a'
    set mouse=v
  else
    set mouse=a
  endif
endf


" set YBUILD and thrift filetype, DEPRECATED
function! DetectFiletypeByFileName()
	if strlen(&filetype) == 0
		let filename = expand('%')
		if filename =~ 'YBUILD$'
			setfiletype python
		elseif filename =~ '.thrift$'
			setfiletype cpp
		endif
	endif
endf
" call DetectFiletypeByFileName()

"functions defined here
function! ToggleCommentCurrentLine() 
	"comment or uncomment the cursor line
	let fileTypes = {'c' : '//', 'cpp' : '//', 'java' : '//', 'sh': '#', 'py' : '#', 'vim' : '"', 'python': '#'}
	let cm = fileTypes[&filetype]
	let len =  strlen(cm)
	if len <= 0
		echo 'cannot find the approriate comment flags for ' &filetype ' filetype'
		return 1
	endif
	let lineNo = line('.')
	let curLine = getline(lineNo)
	let idx = stridx(curLine, cm)
	let result=""
	if idx < 0 
		let idxNonWhileSpace = match(curLine, '\S')
		if idxNonWhileSpace < 0
			echo 'a blank line, skip it'
			return
		endif
		let result .= strpart(curLine, 0, idxNonWhileSpace) 
		let result .= cm . ' '
		let result .= strpart(curLine, idxNonWhileSpace)
	else
		"the comment has exists, now delete it
		let result .= strpart(curLine, 0, idx) 
		let rest = strpart(curLine, idx + len)
		let rest = strpart(rest, match(rest, '\S'))
		let result .= rest
	endif
	call setline('.', result)
endfunction

function! CommentSingleLine(lineNo, pattern)
	let curLine = getline( a:lineNo )
	let idxNonWhileSpace = match(curLine, '\S')
	if idxNonWhileSpace < 0
		" echo 'a blank line, skip it'
		call setline(a:lineNo, curLine . a:pattern)
		return
	endif
	let result = ''
	let result .= strpart(curLine, 0, idxNonWhileSpace)
	let result .= a:pattern 
	let result .= strpart(curLine, idxNonWhileSpace)
	call setline(a:lineNo, result)
endfunction

function! UncommentSingleLine(lineNo, pattern)
	let curLine = getline( a:lineNo )
	let len = strlen(a:pattern)
	let idx = stridx(curLine, a:pattern)
	if idx < 0
		return
	endif
	let result = ''
	let result .= strpart(curLine, 0, idx) 
	let rest = strpart(curLine, idx + len)
	let rest = strpart(rest, match(rest, '\S'))
	let result .= rest
	call setline(a:lineNo, result)
endfunction

function! CountStringInString(line, pattern)
	let cnt = 0
	let idx = stridx(a:line, a:pattern)
	while idx >= 0
		let cnt += 1
		let idx = stridx(a:line, a:pattern, idx + 1)
	endwhile
	return cnt
endfunction

function! LocateMeaningfulBlockLine(lineNo, direction)
	let curLineNo = a:lineNo
	let curLine = getline( curLineNo )
	let pattern = (a:direction ==? 'UP') ? '{' : '}'
	let oppoPattern = (a:direction ==? 'UP') ? '}' : '{'
	let matchPattern = pattern . '\s*$'
	if match(curLine, matchPattern) >= 0
		return curLineNo
	endif
	let cnt = 0
	let cnt += CountStringInString(curLine, pattern)
	let cnt -= CountStringInString(curLine, oppoPattern)
	if cnt == 0
		let cnt = -1
	endif

	if a:direction ==? 'UP'
		let curLineNo -= 1
	else
		let curLineNo += 1
	endif
	let curLine = getline(curLineNo)
	while match(curLine, matchPattern) < 0 || cnt != 0
		let cnt += CountStringInString(curLine, pattern)
		let cnt -= CountStringInString(curLine, oppoPattern)
		" echo curLineNo cnt
		if match(curLine, matchPattern) >= 0 && cnt == 0
			break
		endif
		if a:direction ==? 'UP'
			let curLineNo -= 1
		else
			let curLineNo += 1
		endif
		let curLine = getline(curLineNo)
	endwhile	
	return curLineNo
endfunction

function! CommentBlock()
	"comment a meaningful block of c++, c, java
	"the block must start the { with the end of a line
	let curLineNo = line('.')
	let doComment = (match(getline(curLineNo), '\s*//') < 0)
	" echo 'doComment ' doComment
	let beginLineNo = LocateMeaningfulBlockLine(curLineNo, 'up')
	let endLineNo = LocateMeaningfulBlockLine(curLineNo, 'down')
	" echo beginLineNo endLineNo
	while beginLineNo <= endLineNo
		if doComment
			call CommentSingleLine(beginLineNo, '//')
		else
			call UncommentSingleLine(beginLineNo, '//')
		endif
		let beginLineNo += 1
	endwhile
endfunction

function! InsertCopyRightInFirstLine()
	let curTime  = strftime('%Y-%m-%d %H:%M:%S')
	let cppTime = '// created on ' . curTime
	let pyTime = '# created on ' . curTime
	let shTime = pyTime
	let cpp = ['// Copyright 2012 JIKE.COM ALL Rights Reserved.', '// Author: wangqun@jike.com', cppTime, '']
	let python = ['#!/usr/bin/env python', '# coding: utf-8', '# Copyright 2012 JIKE.COM ALL Rights Reserved.','# Author: wangqun@jike.com', pyTime, '']
	let sh = ['#!/bin/bash', '# author: wangqun@jike.com', shTime, '']
	let others = ['# author: wangqun@jike.com', shTime, '']
	" if &filetype == 'cpp' || &filetype == 'c' || &filetype == 'java'
		" call append(0, cpp)
	" elseif &filetype == 'python'
  if &filetype == 'python'
		call append(0, python)
	elseif &filetype == 'sh'
		call append(0, sh)
	else
		call append(0, others)
	endif
endfunction

au BufNewFile *.py,*.sh :call InsertCopyRightInFirstLine()

function! MoveUpSingleLine()
	let lineNo = line('.')
	if lineNo == 1
		echo 'the first line cannot move up'
		return
	endif
	let curLine = getline(lineNo)
	let lastLine = getline(lineNo - 1)
	call setline(lineNo, lastLine)
	call setline(lineNo - 1, curLine)
endfunction

" nnoremap <buffer> <C-F6> :call DbgRunFile(expand('%'))<cr>
nnoremap <C-F6> :!dbg %<cr>
nnoremap <leader>r :!dbg %<cr>


" gaodg.vim
" Brief: Usefull tools for Doxygen : comment, author, ...
" Version: 0.0.1
" Date: 2011/06/21
" Author: Sanyuan Gao
"
 
function! <SID>GetFileFullName()
  let filename = expand("%:p")
  return filename
endfunction
 
function! <SID>GetFileName()
  let filename = expand("%")
  return filename
endfunction
 
function! <SID>GetFileDir()
  let filedir = expand("%:p")
  return filedir
endfunction
 
function! <SID>GetYear()
  return strftime("%Y")
endfunction
 
function! <SID>GetTime()
  return strftime("%Y-%m-%d %H:%M:%S")
endfunction
 
function! <SID>GetDate()
  return strftime("%Y-%m-%d")
endfunction
 
function! <SID>Trim(rawStr)
  let newStr = substitute(a:rawStr, '\(\s\+\)$', "", "g")
  let newStr = substitute(newStr, '^\(\s\+\)', "", "g")
  return newStr
endfunction
 
function! <SID>CommentSen()
  let cur_line_no  = line(".")
  let cur_line_str = getline(cur_line_no)
  let head_blank = matchstr(cur_line_str, '\(\s*\)')
  let content = strpart(cur_line_str, strlen(head_blank))
  let cur_line_str = head_blank."// ".content
  call setline(cur_line_no, cur_line_str)
endfunction
 
function! <SID>UnCommentSen()
  let cur_line_no  = line(".")
  let cur_line_str = getline(cur_line_no)
  let head_blank = matchstr(cur_line_str, '\(\s*\)')
  let content = strpart(cur_line_str, strlen(head_blank))
  let comment = matchstr(content, '\([/ ]*\)')
  let content = strpart(content, strlen(comment))
  let cur_line_str = head_blank.content
  call setline(cur_line_no, cur_line_str)
endfunction
 
function! <SID>CommentFun()
  let cur_line_no  = line(".")
  let cur_line_str = getline(cur_line_no)
 
  let right_parenthesis_pos = stridx(cur_line_str, ")")
  let line_span = 1
  while -1 == right_parenthesis_pos
    let now_line_str = getline(cur_line_no + line_span)
    let cur_line_str = cur_line_str.now_line_str
    let line_span = line_span + 1
    let right_parenthesis_pos = stridx(cur_line_str, ")")
  endwhile
 
  " == 0 means null line.
  if (strlen(matchstr(cur_line_str, '\S')) == 0)
    return
  endif 
 
  let head_blank = matchstr(cur_line_str, '\(\s*\)')
 
  " erase ending blank(s)
  let cur_line_str = substitute(cur_line_str, '\(\s\+\)$', "", "g")
  " erase blank(s) before '*'
  let cur_line_str = substitute(cur_line_str, '\(\s\+\)\*', "*", "g")
  " erase blank(s) before '&'
  let cur_line_str = substitute(cur_line_str, '\(\s\+\)&', "\\&", "g")
  " erase blank(s) before '('
  let cur_line_str = substitute(cur_line_str, '\s\+(\s\+', '(', "g")
  " erase blank(s) before ')'
  let cur_line_str = substitute(cur_line_str, '\s\+(\s\+', ')', "g")
  " used for operator() function
  let cur_line_str = substitute(cur_line_str, 'operator()', 'GDY_LRBR', "g")
 
  let fun_name = matchstr(cur_line_str, '\(\w\|\[\|\]\)\+(')
  let fun_name = substitute(fun_name, "GDY_LRBR", 'operator()', "g")
  let len_name = strlen  (fun_name)
  let fun_name = strpart (fun_name, 0, len_name-1)
 
  let ret_type = matchstr(cur_line_str, '^\s*\(\w\|:\)\+\(\s\|\*\|&\)\+')
 
  let arg_list = matchstr(cur_line_str, '(\(\w\|\s\|,\|\*\|:\|&\|<\|>\|=\|"\)*)')
  let len_list = strlen  (arg_list)
  let arg_list = strpart (arg_list, 1, len_list-2)
 
  let dis_diff = line('$') - cur_line_no + 1
  call append(line('$')-dis_diff, head_blank."/**")
  call append(line('$')-dis_diff, head_blank."* @brief ".fun_name)
 
  let flag = 0
  for _arg in split(arg_list, ',')
  if (0 == flag && 0 != strlen(<SID>Trim(_arg)))
  call append(line('$')-dis_diff, head_blank."* ")
  endif
  if (0 != strlen(<SID>Trim(_arg)))
  call append(line('$')-dis_diff, head_blank."* @param ".<SID>Trim(_arg))
  let flag = flag + 1
  endif
  endfor
 
  if (0 != strlen(ret_type))
  call append(line('$')-dis_diff, head_blank."* ")
  call append(line('$')-dis_diff, head_blank."* @return ".<SID>Trim(ret_type))
  endif
 
  call append(line('$')-dis_diff, head_blank."*/")
 
  startinsert! 
endfunction
 
function! <SID>CommentVal()
  call cursor(line('.'), col('$'))
  exec "normal! a\t\t  /*<  >*/"
  call cursor(line('.'), col('$') - 4)
endfunction
 
function! <SID>CommentClass()
  let cur_line_no  = line(".")
  let cur_line_str = getline(cur_line_no)
 
  let head_blank = matchstr(cur_line_str, '\(\s*\)')
  let info_class = matchstr(cur_line_str, '^\(\w\|\s\)\+')
 
  let dis_diff = line('$') - cur_line_no + 1
  call append(line('$')-dis_diff, head_blank."/**")
  call append(line('$')-dis_diff, head_blank."* @".<SID>Trim(info_class))
  call append(line('$')-dis_diff, head_blank."*/")
 
  call cursor(line('.')-2, col('$'))
 
endfunction
 
"""""""""""""""""""""""""""""""""""""
" Insert header for *.h,*.c,... file
"""""""""""""""""""""""""""""""""""""
function! <SID>InsertFormat()
  " Test authorName variable
 
  let ln1 = "// Copyright ".<SID>GetYear()." Jike Inc. All Rights Reserved."
  let ln2 = "// Author: wangqun@jike.com"."(Wang Qun)"
  let ln3 = "// Date  : ".<SID>GetTime()
  " let ln4 = "// File  : ".<SID>GetFileName()
  let ln5 = "// Brief : "
 
  call append(line('$') - 1, ln1)
  call append(line('$') - 1, ln2)
  call append(line('$') - 1, ln3)
  " call append(line('$') - 1, ln4)
  call append(line('$') - 1, ln5)
  call cursor(4, 12)
 
  startinsert!
endfunction
 
function! <SID>InsertHeadFormat()
  call <SID>InsertFormat()
  let idx = 10
  while (idx > 0)
    call append(line('$') - 1, "")
    let idx = idx - 1
  endwhile
 
  let filename = <SID>GetFileFullName()
  let dev_posi = stridx(filename, "trunk")
  if dev_posi != -1
    let filename = strpart(filename, dev_posi + 6)
  else
    let dev_posi = stridx(filename, "coding")
    if dev_posi != -1
      let filename = strpart(filename, dev_posi + 7)
    else
      let dev_posi = stridx(filename, "sentiment-dev")
      if dev_posi != -1
        let filename = strpart(filename, dev_posi + 14)
      else
        let filename = <SID>GetFileName()
      endif
    endif
  endif
 
  let s = toupper(filename)
  let s = substitute(s, "[.]", "_", "g")
  let s = substitute(s, "[/]", "_", "g")
  let s = substitute(s, "[-]", "_", "g")
  call append(line('$') - 10, "#ifndef ". s. "_")
  call append(line('$') - 10, "#define ". s. "_")
  call append(line('$') - 0, "#endif  // ". s. "_")
  call append(line('$') - 0, "/* to be or not to be, that's the question. */")
  startinsert!
endfunction
 
function! <SID>GetFileDIRANDINSERT()
  let filedir = <SID>GetFileFullName()
  let LastSlash = strridx(filedir, "/")
  let filedir = strpart(filedir, 0, LastSlash + 1)
  "echo filedir
  let dev_posi = stridx(filedir, "trunk")
  if dev_posi != -1
    let filedir = strpart(filedir, dev_posi + 6)
  else
    let dev_posi = stridx(filedir, "coding")
    if dev_posi != -1
      let filedir = strpart(filedir, dev_posi + 7)
    else
      let dev_posi = stridx(filedir, "sentiment-dev")
      if dev_posi != -1
        let filedir = strpart(filedir, dev_posi + 14)
      endif
    endif
  endif
 
  if dev_posi != -1
    let s = filedir
    let cur_line_no = line(".")
    let cur_col_no  = col(".")
    let cur_line_str = getline(cur_line_no)
    let col_lef_content = strpart(cur_line_str, 0, cur_col_no - 1)
    let col_rig_content = strpart(cur_line_str, cur_col_no - 1)
    let cur_line_str = col_lef_content.s.col_rig_content
    call setline(cur_line_no, cur_line_str)
  endif
endfunction
 
function! <SID>FetchCode(filename)
  exec "$read "."~/.vim/file/".a:filename
endfunction
 
 
""""""""""""""""""""""""""
" Shortcuts...
""""""""""""""""""""""""""
"command! -nargs=0 Dox :call <SID>DoxygenCommentFunc()
"command! -nargs=0 DoxLic :call <SID>DoxygenLicenseFunc()
"command! -nargs=0 DoxAuthor :call <SID>DoxygenAuthorFunc()
"command! -nargs=1 DoxUndoc :call <SID>DoxygenUndocumentFunc(<q-args>)
"command! -nargs=0 DoxBlock :call <SID>DoxygenBlockFunc()
"command! -nargs=0 Oc :call <SID>FetchCode("c_class.tpl")
command! -nargs=0 Rinclude read ~/.vim/file/include.h
command! -nargs=0 Rcc read ~/.vim/file/class.cc
command! -nargs=0 Rmain read ~/.vim/file/main.cc
command! -nargs=0 Rtest read ~/.vim/file/test.cc
command! -nargs=0 RYBUILD read ~/.vim/file/YBUILD
command! -nargs=0 Rmapred read ~/.vim/file/mapred.cc
command! -nargs=0 Rpy read ~/.vim/file/python.py
command! -nargs=0 Rawk read ~/.vim/file/template.awk

command! -nargs=0 Cf :call <SID>CommentFun()
command! -nargs=0 Cv :call <SID>CommentVal()
command! -nargs=0 Cc :call <SID>CommentClass()
command! -nargs=0 Cs :call <SID>CommentSen()
command! -nargs=0 UnCs :call <SID>UnCommentSen()
command! -nargs=0 GI :call <SID>GetFileDIRANDINSERT()
 
"autocmd BufNewFile *.h,*.cpp,*.c,*.cc :call <SID>DoxygenAuthorFunc()
autocmd BufNewFile *.cpp,*.c,*.cc :call <SID>InsertFormat()
autocmd BufNewFile *.h :call <SID>InsertHeadFormat()

""""""""""""""""""""""""""
" end gaosy.vim. It's very useful.
"""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" lookupfile setting , added in 2013-02-04
" """"""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 1        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
if stridx(getcwd(), 'newproduct') >= 0
  let g:lookup_tag_file="/home/wangq/jike/newproduct-coding/filenametags"        "设置tag文件的名字
  if filereadable(g:lookup_tag_file)
    let g:LookupFile_TagExpr = g:lookup_tag_file
  endif
endif
" "映射LookupFile为,lf
nmap <silent> <leader>lf :LUTags<cr>
" "映射LUBufs为,lb
nmap <silent> <leader>lb :LUBufs<cr>
" "映射LUWalk为,ld,即查找目录
nmap <silent> <leader>ld :LUWalk<cr>

"""""""""""""""""""""""""""""""""""""""
" install YBUILD quickfix
function! Blade(...) 
  let l:old_makeprg = &makeprg 
  setlocal makeprg=ymake_quickfix
  setlocal efm=%f:%l:\ %m,In\ file\ included\ from\ %f:%l:,\^I\^Ifrom\ %f:%l%m
  execute "make " . join(a:000) 
  "execute "make "
  let &makeprg=old_makeprg 
endfunction
command! -complete=dir -nargs=* Blade call Blade('<args>')
autocmd filetype c,cc,cpp map <buffer> <leader>c	<esc>:w<cr>:Blade<cr>

function! OnlyCompile() 
  let l:old_makeprg = &makeprg 
  setlocal makeprg=only_compile
  setlocal efm=%f:%l:\ %m,In\ file\ included\ from\ %f:%l:,\^I\^Ifrom\ %f:%l%m
  execute "make %"
  let &makeprg=old_makeprg 
endfunction
command! -complete=dir -nargs=* OnlyCompile call OnlyCompile()
autocmd filetype c,cc,cpp map <buffer> <leader>oc	<esc>:w<cr>:OnlyCompile<cr>

function! CompileTarget() 
  let l:old_makeprg = &makeprg 
  setlocal makeprg=compile_target
  setlocal efm=%f:%l:\ %m,In\ file\ included\ from\ %f:%l:,\^I\^Ifrom\ %f:%l%m
  execute "make %" 
  "execute "make "
  let &makeprg=old_makeprg 
endfunction
command! -complete=dir -nargs=* CompileTarget call CompileTarget()
autocmd filetype c,cc,cpp map <buffer> <leader>t	<esc>:w<cr>:CompileTarget<cr>
"""""""""""""""""""""""""""""""""""""""

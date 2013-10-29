nmap <C-M-Down> ddpk<cr>
nmap <C-M-Up> :call MoveUpSingleLine()<cr>k
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

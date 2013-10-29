imap <C-c> <esc>:call ToggleCommentCurrentLine()<cr>
nmap <C-c> :call ToggleCommentCurrentLine()<cr>
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

autocmd filetype c,cpp,java nmap ;b :call CommentBlock()<cr>


function! InsertCopyRightInFirstLine()
    " let date = strftime('%Y-%m-%d')
    " let cppdate = . '// Date: '. date
    "let pythondate = . '# Date: '. date
	let cpp = ['// Copyright 2012 JIKE.COM ALL Rights Reserved.', '// Author: wangqun@jike.com']
    " cpp.add(cppdate)
	let python = ['#!/usr/bin/env python', '# coding: utf-8', '# Copyright 2012 JIKE.COM ALL Rights Reserved.','# Author: wangqun@jike.com']
    " python.add(pythondate)
	if &filetype == 'cpp' || &filetype == 'c'
		echo 
		call append(0, cpp)
	endif
	if &filetype == 'py' || &filetype == 'python'
		call append(0, python)
	endif
endfunction


let s:pat_record = '\v(\n|%^)\zs\d\d\d\d-\d\d-\d\d.*'
            \ . '(\n^\s.*$)*\ze'
            \ . '\n*(\d\d\d\d-\d\d-\d\d|%$)'

function! mobean#next_record(type, backwards, visual)
    if a:visual
        normal! gv
    endif

    if a:type == 1
        let flags = ''
    elseif a:type == 2
        let flags = 'e'
    endif

    if a:backwards
        let dir = '?'
    else
        let dir = '/'
    endif

    execute 'keeppattern silent normal! ' . dir . s:pat_record . dir . flags . "\r"
endfunction

nnoremap <leader>g :set opfunc=<sid>ReconOp<cr>g@
vnoremap <leader>g :<c-u>call <sid>ReconOp(visualmode())<cr>

function! s:ReconOp(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    execute "cexpr system(\"" . escape(<sid>ReconExpr(@@), '"') . "\")"

    let @@ = saved_unnamed_register
endfunc

function! s:ReconExpr(account)
    return "bean-query " . expand("%") . " " .
         \ shellescape('select location, date, narration, position '
                   \ . 'where account ~ "' . a:account . '"')
endfunc

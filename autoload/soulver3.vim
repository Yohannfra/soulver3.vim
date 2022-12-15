" Assouline Yohann
" April 2022

function! s:CheckSoulver3Install()
    let l:basic_calc = " 21 + 21"
    let l:res = system(g:soulver_cli_path . l:basic_calc)
    return l:res == "42\n"
endfunction

function! s:CountLineToOffset(fc)
    let l:count = 0

    for l in a:fc
        if (l[0] == '#') || len(l) == 0
            let l:count += 1
        else
            break
        endif
    endfor

    return l:count
endfunction

function! soulver3#Soulver()
    if ! exists("g:soulver_cli_path")
        echoerr "g:soulver_cli_path not defined"
        return
    endif
    if s:CheckSoulver3Install() == 0
        echoerr "Basic calculation with soulver gave wrong result, check your installation"
        return
    endif

    let l:file_content = getline(1,'$')
    let l:file_content_str = join(l:file_content, "\n")
    let l:soulver_res = systemlist("echo '" . l:file_content_str . "' | " . g:soulver_cli_path)
    let l:file_name = expand('%:t:r')
    let l:soulver_buf_name = l:file_name . "_SoulverViewBuffer"

    let l:nb_empty_lines = s:CountLineToOffset(l:file_content)

    let l:currentWindow=winnr()

    if bufwinid(l:soulver_buf_name) == -1
        :vnew
        :setlocal buftype=nofile
        :setlocal bufhidden=hide
        :setlocal noswapfile
        :setlocal filetype=soulver
        :setlocal nonumber norelativenumber
        :exe "file " . l:soulver_buf_name
    else
        exe l:currentWindow . "wincmd l"
        :%delete
    endif

    :call append(0, repeat([''], l:nb_empty_lines))
    :call append(l:nb_empty_lines, l:soulver_res)
    :d
    exe l:currentWindow . "wincmd h"
endfunction

function! soulver3#LiveOn()
    call soulver3#Soulver()
    augroup SoulverVimAutocomandGroup
        autocmd TextChanged,TextChangedP,TextChangedI *.soulver :call soulver3#Soulver()
    augroup END
endfunction

function! soulver3#LiveOff()
    augroup SoulverVimAutocomandGroup
        autocmd!
    augroup END
endfunction

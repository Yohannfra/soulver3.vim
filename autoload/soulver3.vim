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
        echoerr "Basic calculus with soulver gave wrong result, check your installation"
        return
    endif

    let l:file_content = getline(1,'$')
    let l:file_content_str = join(l:file_content, "\n")
    let l:soulver_res = systemlist("echo '" . l:file_content_str . "' | " . g:soulver_cli_path)

    let l:nb_empty_lines = s:CountLineToOffset(l:file_content)

    :vnew
    :setlocal buftype=nofile
    :setlocal bufhidden=hide
    :setlocal noswapfile

    :call append(0, repeat([''], l:nb_empty_lines))
    :call append(l:nb_empty_lines, l:soulver_res)
    :d
endfunction

function! soulver3#LiveOn()
    echo "Enabling soulver live mode (TODO)"
endfunction

function! soulver3#LiveOff()
    echo "Disabling soulver live mode (TODO)"
endfunction

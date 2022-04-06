function! soulver#On()
    if ! exists("g:soulver_cli_path")
        echoerr "g:soulver_cli_path not defined"
        return
    endif
endfunction

function! soulver#Off()

endfunction

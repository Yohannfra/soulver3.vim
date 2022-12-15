" Assouline Yohann
" April 2022

if exists('g:soulver_vim_loadded')
    finish
endif

let g:soulver_vim_loadded = 1

let g:soulver_cli_path = get(g:, 'soulver_cli_path', "'/Applications/Soulver\ 3.app/Contents/MacOS/CLI/soulver'")

command! Soulver :call soulver3#Soulver()
command! SoulverLiveOn :call soulver3#LiveOn()
command! SoulverLiveOff :call soulver3#LiveOff()

let g:soulver_update_on_save = get(g:, 'soulver_update_on_save', 1)

autocmd FileType soulver setlocal commentstring=#\ %s

if g:soulver_update_on_save == 1
    autocmd BufWritePost *.soulver :call soulver3#Soulver()
endif

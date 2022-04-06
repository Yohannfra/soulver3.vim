" Assouline Yohann
" April 2022

if exists('g:soulver_vim_loadded')
    finish
endif

let g:soulver_vim_loadded = 1

command! SoulverOn:call soulver#On()
command! SoulverOff:call soulver#Off()

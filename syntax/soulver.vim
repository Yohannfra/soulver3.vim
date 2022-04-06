" Vim syntax file for Soulver 3 files
" Maintainer: Yohann Assouline
" Latest Revision: 6 April 2022

if exists("b:current_syntax")
    finish
endif
let b:current_syntax = "soulver"

let s:save_cpo = &cpo
set cpo&vim

" comments
syn match   soulComment "\v#.*$"
hi def link soulComment Comment

syn keyword soulUnits
            \ s sec secs min mins hrs hour hours day days week weeks month months year years ms us µs ns
            \ m metre metres km kilometre kilometres cm centimetre centimetres
hi def link soulUnits Identifier

" months and days
syn keyword soulMonthsAndDays
            \ monday tuesday wednesday thursday friday saturday sunday
            \ Monday Tuesday Wednesday Thursday Friday Saturday Sunday
            \ Monday Tuesday Wednesday Thursday Friday Saturday Sunday
            \ January February March April May June July August September October November December
            \ january february march april may june july august september october november december

hi def link soulMonthsAndDays Identifier

" currency
syn keyword soulCurrency BTC ETH XRP LTC EOS BCH TRX XLM BNB BSV ADA XMR DASH NEO ETC DOGE SOL AVAX LUNA DOT SHIB
hi def link soulCurrency Special

" numbers
syn match   soulNumber      "\v<\d+(\.)@!>"
syn match   soulNumber      "\v<0x\x+(\.)@!>"
hi def link soulNumber Number

" operators
syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="

highlight link potionOperator Operator


let &cpo = s:save_cpo
unlet s:save_cpo

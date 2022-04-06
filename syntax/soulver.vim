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
            \ AED AFN ALL AMD ANG AOA ARS AUD AWG AZN BAM BBD BDT BGN BHD BIF BMD BND BOB BRL BSD BTC BTN BWP BYR BZD CAD CDF CHF CLF CLP CNY COP CRC CUC CUP CVE CZK DJF DKK DOP DZD EEK EGP ERN ETB EUR FJD FKP GBP GEL GGP GHS GIP GMD GNF GTQ GYD HKD HNL HRK HTG
            \ HUF IDR ILS IMP INR IQD IRR ISK JEP JMD JOD JPY KES KGS KHR KMF KPW KRW KWD KYD KZT LAK LBP LKR LRD LSL LTL LVL LYD MAD MDL MGA MKD MMK MNT MOP MRO MUR MVR MWK MXN MYR MZN NAD NGN NIO NOK NPR NZD OMR PAB PEN PGK PHP PKR PLN PYG QAR RON RSD RUB RWF SAR SBD
            \ SCR SDG SEK SGD SHP SLL SOS SRD STD SVC SYP SZL THB TJS TMT TND TOP TRY TTD TWD TZS UAH UGX USD UYU UZS VEF VND VUV WST XAF XAG XAU XCD XDR XOF XPF YER ZAR ZMK ZMW ZWL
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

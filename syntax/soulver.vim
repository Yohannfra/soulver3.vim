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
            \ s sec min h Days Weeks Months Years ms µs ns
            \ m metres km kilometres cm centimetres mm millimetres µm micrometres nm nanometres in ft yd mi fur ly NM ftm
            \ m² m^2 m2 km² km^2 km2 cm² cm^2 cm2 mm² mm^2 mm2 µm² µm^2 µm2 in² sqin in^2 in2 ft² sqft ft^2 ft2 yd² sqyd yd^2 yd2 mi² sqmi mi^2 mi2 ac ha Ares
            \ L liters litres kL ML mL m³ m3 m^3 km³ km3 km^3 cm³ cm3 cm^3 mm³ mm3 mm^3 cup in³ in3 in^3 ft³ cuft ft³ ft3 ft^3 yd³ yd³ cuyd yd3 yd^3 mi³ mi³ mi3 mi^3 miles miles^3 fl oz Pints Cups tsp tbsp qt gal af bsh
            \ g kg mg ng t oz lb st ton ct
            \ °C ºC C degC celcius °F ºF F degF fahrenheit
            \ w kW MW GW TW mW hp
            \ m/s km/h mph kn
            \ B bit YB ZB EB PB TB GB MB kB Yb Zb Eb Pb Tb Gb Mb kb YiB ZiB EiB PiB TiB GiB MiB KiB Yib Zib Eib Pib Tib Gib Mib Kib
            \ Bps bps YBps ZBps EBps PBps TBps GBp MBp KBp Ybps Zbps Ebps Pbp Tbp Gbp Mbp Kbp YiBps ZiBps EiBps PiBps TiBps GiBps MiBps KiBps Yibps Zibps Eibps Pibps Tibps Gibps Mibps Kibps
            \ px Em Pt
            \ hz kHz MHz GHz THz mHz µHz nHz
            \ J kJ MJ GJ cal kCal Ws Wm Wh kWh MWh GWh TWh
            \ rad
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

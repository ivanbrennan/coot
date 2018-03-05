" Vim color scheme
"
" Name:       root.vim
" Maintainer: Ivan Brennan <ivan.brennan@gmail.com>
" License:    MIT

set background=dark

hi clear
if exists('syntax_on')
   syntax reset
endif

let g:colors_name = 'root'

let s:black  = ['#0e1111', 232]
let s:egray  = ['#151515', 233]
let s:bgray  = ['#181818', 233]
let s:xgray  = ['#1c1c1c', 234]
let s:pgray  = ['#1f1f1f', 235]
let s:zgray  = ['#1c1e1f', 234]
let s:kgray  = ['#272a2b', 242]
let s:vgray  = ['#252b32', 242]
let s:mgray  = ['#2c2f30', 242]
let s:cgray  = ['#737373', 243]
let s:ngray  = ['#757d80', 242]
let s:dgray  = ['#a9a9a9', 248]
let s:lgray  = ['#d3d3d3', 252]
let s:white  = ['#eeeeee', 255]

let s:sblue  = ['#778899', 67]
let s:oblue  = ['#c4d5e5', 67]
let s:yellow = ['#ffff00', 226]
let s:red1   = ['#682421', 160]
let s:red    = ['#391716', 160]
let s:green  = ['#1d2717', 28]
let s:lime   = ['#bbe068', 28]
let s:melon  = ['#9bc53c', 28]

let s:cyan   = ['#26a6a6', 14]
let s:cyand  = ['#48778b', 66]
let s:cyanf  = ['#008787', 30]
let s:cyane  = ['#a0d649', 30]

let s:default_fg = s:lgray
let s:default_bg = s:bgray

let s:italic    = 'italic'
let s:bold      = 'bold'
let s:underline = 'underline'
let s:none      = 'NONE'

let s:none_lst    = [s:none, s:none]
let s:default_lst = []
let s:default_str = ''

if !exists("g:monochrome_italic_comments")
  let g:monochrome_italic_comments = 1
endif
let s:comment_attr = g:monochrome_italic_comments ? s:italic : s:none

function! s:hi(...)
    let group = a:1
    let fg    = get(a:, 2, s:default_fg)
    let bg    = get(a:, 3, s:default_bg)
    let attr  = get(a:, 4, s:default_str)

    let cmd = ['hi', group]

    if fg != s:default_lst
        call add(cmd, 'guifg='.fg[0])
        call add(cmd, 'ctermfg='.fg[1])
    endif

    if bg != s:default_lst
        call add(cmd, 'guibg='.bg[0])
        call add(cmd, 'ctermbg='.bg[1])
    endif

    if attr != s:default_str
        call add(cmd, 'gui='.attr)
        call add(cmd, 'cterm='.attr)
    endif

    exec join(cmd, ' ')
endfunction


"
" --- Vim interface ------------------------------------------------------------
"

call s:hi('Normal')
call s:hi('Cursor', s:black, s:lgray)
call s:hi('CursorLine', s:default_lst, s:xgray, s:none)
call s:hi('CursorLineNr', s:cgray, s:default_bg)
call s:hi('ColorColumn', s:default_fg, s:xgray)
call s:hi('IncSearch', s:lime, s:xgray, s:bold)
call s:hi('Search', s:none_lst, s:vgray, s:none)
call s:hi('Visual', s:default_lst, s:mgray)
call s:hi('ErrorMsg', s:melon, s:default_bg)
call s:hi('VertSplit', s:kgray, s:default_bg, s:none)
call s:hi('StatusLine', s:oblue, s:zgray, s:none)
call s:hi('StatusLineNC', s:cgray, s:zgray, s:none)

" Tildes at the bottom of a buffer, etc.
call s:hi('NonText', s:dgray)
call s:hi('EndOfBuffer', s:xgray, s:xgray)

" Folding.
call s:hi('FoldColumn', s:dgray)
call s:hi('Folded')

" Line numbers gutter.
call s:hi('LineNr', s:mgray)

" Small arrow used for tabs.
call s:hi('SpecialKey', s:cgray, s:default_bg)

" File browsers.
call s:hi('Directory', s:white, s:default_bg, s:bold)

" Help.
call s:hi('helpSpecial')
call s:hi('helpHyperTextJump', s:sblue, s:default_bg, s:underline)
call s:hi('helpNote')

" Popup menu.
call s:hi('Pmenu', s:ngray, s:xgray)
call s:hi('PmenuSel', s:oblue, s:pgray, s:bold)
call s:hi('PmenuSbar', s:bgray, s:bgray)
call s:hi('PmenuThumb', s:dgray, s:mgray)

" Notes.
call s:hi('Todo', s:lime, s:default_bg, s:bold)


"
" --- Programming languages ----------------------------------------------------
"

call s:hi('Statement', s:white, s:default_bg, s:bold)
call s:hi('PreProc', s:white, s:default_bg, s:bold)
call s:hi('String', s:sblue)
call s:hi('Comment', s:cyand, s:default_bg, s:comment_attr)
call s:hi('Constant')
call s:hi('Type', s:white, s:default_bg, s:bold)
call s:hi('Function', s:white)
call s:hi('Identifier')
call s:hi('Special')
call s:hi('MatchParen', s:lime, s:default_bg, s:bold)
call s:hi('Question', s:cgray, s:default_bg)
call s:hi('MoreMsg', s:dgray, s:default_lst, s:bold)


"
" --- VimL ---------------------------------------------------------------------
"

call s:hi('vimOption')
call s:hi('vimGroup')
call s:hi('vimHiClear')
call s:hi('vimHiGroup')
call s:hi('vimHiAttrib')
call s:hi('vimHiGui')
call s:hi('vimHiGuiFgBg')
call s:hi('vimHiCTerm')
call s:hi('vimHiCTermFgBg')
call s:hi('vimSynType')
hi link vimCommentTitle Comment


"
" --- Ruby ---------------------------------------------------------------------
"

call s:hi('rubyConstant')
call s:hi('rubySharpBang', s:cgray)
call s:hi('rubyStringDelimiter', s:sblue)
call s:hi('rubyStringEscape', s:sblue)
call s:hi('rubyRegexpEscape', s:sblue)
call s:hi('rubyRegexpAnchor', s:sblue)
call s:hi('rubyRegexpSpecial', s:sblue)


"
" --- Elixir -------------------------------------------------------------------
"

call s:hi('elixirAlias', s:default_fg, s:default_bg, s:none)
call s:hi('elixirDelimiter', s:sblue)
call s:hi('elixirSelf', s:default_fg, s:default_bg, s:none)

" For ||, ->, etc.
call s:hi('elixirOperator')

" Module attributes like @doc or @type.
hi link elixirVariable Statement

" While rendered as comments in other languages, docstrings are strings,
" experimental.
hi link elixirDocString String
hi link elixirDocTest String
hi link elixirStringDelimiter String


"
" --- Perl ---------------------------------------------------------------------
"

call s:hi('perlSharpBang', s:cgray)
call s:hi('perlStringStartEnd', s:sblue)
call s:hi('perlStringEscape', s:sblue)
call s:hi('perlMatchStartEnd', s:sblue)


"
" --- Python -------------------------------------------------------------------
"

call s:hi('pythonEscape', s:sblue)


"
" --- JavaScript ---------------------------------------------------------------
"

call s:hi('javaScriptFunction', s:white, s:default_bg, s:bold)


"
" --- Diffs --------------------------------------------------------------------
"

call s:hi('diffFile', s:cgray)
call s:hi('diffNewFile', s:cgray)
call s:hi('diffIndexLine', s:cgray)
call s:hi('diffLine', s:cgray)
call s:hi('diffSubname', s:cgray)
call s:hi('DiffAdd', s:default_lst, s:green)
call s:hi('DiffDelete', s:xgray, s:xgray)
call s:hi('DiffChange', s:default_lst, s:red)
call s:hi('DiffText', s:lgray, s:red1, s:none)
hi link diffAdded DiffAdd
hi link diffRemoved DiffChange

"
" --- Markdown -----------------------------------------------------------------
"

call s:hi('Title', s:white, s:default_bg, s:bold)
call s:hi('markdownHeadingDelimiter', s:white, s:default_bg, s:bold)
call s:hi('markdownHeadingRule', s:white, s:default_bg, s:bold)
call s:hi('markdownLinkText', s:sblue, s:default_bg, s:underline)


"
" --- vim-fugitive -------------------------------------------------------------
"

call s:hi('gitcommitComment', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitOnBranch', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitBranch', s:sblue, s:default_bg, s:none)
call s:hi('gitcommitHeader', s:white, s:default_bg, s:bold)
call s:hi('gitcommitSelected', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitDiscarded', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitSelectedType', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitDiscardedType', s:default_fg, s:default_bg, s:none)


"
" --- NeoMake ------------------------------------------------------------------
"

call s:hi('NeomakeMessageSign')
call s:hi('NeomakeWarningSign', s:sblue)
call s:hi('NeomakeErrorSign', s:yellow)
call s:hi('NeomakeInfoSign')
call s:hi('NeomakeError', s:yellow)
call s:hi('NeomakeInfo', s:default_fg, s:default_bg, s:bold)
call s:hi('NeomakeMessage')
call s:hi('NeomakeWarning', s:yellow)

  "@@@@@@@@@@@@@@@@@(#,%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  "@@@@@@@@@@@@@@@@,///////(.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  "@@@@@@@@@@@@@@#///# #/////(.@@@@@@@@@@.@@@@@@@@@@@@@@@@@@@@
  "@@@@@@@@@@@@@@...@@@///////,/(.*&@@@@(%@@@@@@@@@@@@@@@@@@@@
  "@@@@@@@@@@@@@@@@@@.,,#////,////////((%,@@@@@@@@@@@@@@@@@@@@
  "@@@@@@@@@@@@@@@@@@@./%%%/. //////(  (/%@@@@@@@@@@@@@@@@@@@@
  "@@@@@@@@@@@@@@@@@@@@&&%#%%////(/     #/@@@@@@@@@@@@@@@@@@@@
  "@@@@@@@@@@@@@@@@@@@@## %.//(  %% *%%   # @@@@@@@@@@@@@@#%%#
  "@@@@@@@@@@@@@@@@@@@@ #//(    &*%%,%%/     */(@@@@@@@@@%%%/@
  "@@@@@@@@@@@@@@@@@@@,#// %.    **      ,,  ,@@@@@@@@@*%%%.@@
  "@@@@ #&@@@@@@@@@@@.#.   %###,     ,##*#/%@@@@@@@@&%%&%*%@@@
  "@@@@.%%(@@@@@&%.##     .,%(*((#######*#% @@@@@@(,%%,%%/%/@@
  "@@@@@@(%%#&.%%#@@@@* (/.###########%,,*/.@@%,**%%%%*%& @@
  ",%%%%#,.%%%%%..(%@@@(******************,***/**(,*%%  .@@@@@
  "@@(,,..&%%%%%%**/*/************     ***./*****/**    (@@@@@
  "@@@&%%%,%* ,&%,,*,****/*******  ***,.*(%@*****.***   *%@@@@
  "@@@@(@@@@      **,*** &(****** ***** *.@@@&*(/*(**,  *#@@@@
  "@@@@@@@@@     **(*/*@@.(*****,.***** (.@@@@@@@@@(*/**(@@@@@
  "@@@@@@@@@%/  ,**.&@@@@(*******  ,*  *,.@@@@@@@@@@@@@@@@@@@@
  "@@@@@@@@@@.**/(*@@@@@(*********,  ***./*@@@@@@@@@@@@@@@@@@@
  "@@@@@@@@@@@@@@@@(/.********************.***(*@@@@@@@@@@@@@@
  "@@@@@@@@@@@@@@@(***********************,****@@@@@@@@@@@@@@@
  "@@@@@@@@@@@@@@@(*************** ********/,@@@,&@@@@@@@@@@@@
  "@@@@@@@@@@@@@@@/(*******,****************(&@@/,,%@@@@@@@@@@
  "@@@@@@@@@@@@@@@@@/***,/****************((&@@@@&&@@@@@@@@@@@
  "@@@@@@@@@@@@@@@@@@@@@@@ (***********/(.@@@@@@@@@@@@@@@@@@@@
  "@@@@@@@@@@@@@@@@@@@@@@@@@@@/ ... *%@@@@@@@@@@@@@@@@@@@@@@@@


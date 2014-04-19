" Vim colorscheme template file
" Author: Gerardo Galindez <gerardo.galindez@gmail.com>
" Maintainer: Gerardo Galindez <gerardo.galindez@gmail.com>
" Notes: To check the meaning of the highlight groups, :help 'highlight'

" --------------------------------
set background=dark
" - or ---------------------------
"set background=light
" --------------------------------

highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="Supergirl in the clouds"

"----------------------------------------------------------------
" General settings                                              |
"----------------------------------------------------------------
"----------------------------------------------------------------
" Syntax group   | Foreground    | Background    | Style        |
"----------------------------------------------------------------

" --------------------------------
" Editor settings
" --------------------------------
hi Normal          ctermfg=7       ctermbg=0       cterm=none
hi Cursor          ctermfg=none    ctermbg=none    cterm=none
hi CursorLine      ctermfg=none    ctermbg=9       cterm=none
hi LineNr          ctermfg=8       ctermbg=none    cterm=none
hi CursorLineNR    ctermfg=1       ctermbg=none    cterm=none

" -----------------
" - Number column -
" -----------------
hi CursorColumn    ctermfg=none    ctermbg=none    cterm=none
hi FoldColumn      ctermfg=none    ctermbg=none    cterm=none
hi SignColumn      ctermfg=none    ctermbg=none    cterm=none
hi Folded          ctermfg=none    ctermbg=none    cterm=none

" -------------------------
" - Window/Tab delimiters - 
" -------------------------
hi VertSplit       ctermfg=8       ctermbg=8       cterm=none
hi ColorColumn     ctermfg=none    ctermbg=9       cterm=none
hi TabLine         ctermfg=none    ctermbg=none    cterm=none
hi TabLineFill     ctermfg=none    ctermbg=none    cterm=none
hi TabLineSel      ctermfg=none    ctermbg=none    cterm=none

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
hi Directory       ctermfg=3       ctermbg=none    cterm=none
hi Search          ctermfg=15      ctermbg=2       cterm=none
hi IncSearch       ctermfg=15      ctermbg=2       cterm=none

" -----------------
" - Prompt/Status -
" -----------------
hi StatusLine      ctermfg=15      ctermbg=2       cterm=none
hi StatusLineNC    ctermfg=none    ctermbg=8       cterm=none
hi WildMenu        ctermfg=0       ctermbg=2       cterm=none
hi Question        ctermfg=none    ctermbg=none    cterm=none
hi Title           ctermfg=none    ctermbg=none    cterm=none
hi ModeMsg         ctermfg=none    ctermbg=none    cterm=none
hi MoreMsg         ctermfg=none    ctermbg=none    cterm=none

" --------------
" - Visual aid -
" --------------
hi MatchParen      ctermfg=15      ctermbg=4       cterm=none
hi Visual          ctermfg=none    ctermbg=6       cterm=none
hi VisualNOS       ctermfg=none    ctermbg=6       cterm=none
hi NonText         ctermfg=none    ctermbg=none    cterm=none

hi Todo            ctermfg=0       ctermbg=8       cterm=none
hi Underlined      ctermfg=none    ctermbg=none    cterm=none
hi Error           ctermfg=15      ctermbg=1       cterm=none
hi ErrorMsg        ctermfg=1       ctermbg=none    cterm=none
hi WarningMsg      ctermfg=3       ctermbg=none    cterm=none
hi Ignore          ctermfg=none    ctermbg=none    cterm=none
hi SpecialKey      ctermfg=none    ctermbg=8       cterm=none

" --------------------------------
" Variable types
" --------------------------------
hi Constant        ctermfg=1       ctermbg=none    cterm=none
hi String          ctermfg=4       ctermbg=none    cterm=none
hi StringDelimiter ctermfg=4       ctermbg=none    cterm=none
hi Character       ctermfg=4       ctermbg=none    cterm=none
hi Number          ctermfg=10      ctermbg=none    cterm=none
hi Boolean         ctermfg=10      ctermbg=none    cterm=none
hi Float           ctermfg=10      ctermbg=none    cterm=none

hi Identifier      ctermfg=3       ctermbg=none    cterm=none
hi Function        ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Language constructs
" --------------------------------
hi Statement       ctermfg=1       ctermbg=none    cterm=none
hi Conditional     ctermfg=1       ctermbg=none    cterm=none
hi Repeat          ctermfg=1       ctermbg=none    cterm=none
hi Label           ctermfg=1       ctermbg=none    cterm=none
hi Operator        ctermfg=none    ctermbg=none    cterm=none
hi Keyword         ctermfg=1       ctermbg=none    cterm=none
hi Exception       ctermfg=1       ctermbg=none    cterm=none
hi Comment         ctermfg=8       ctermbg=none    cterm=none

" 'special' for bash
hi Special         ctermfg=none    ctermbg=none    cterm=none
hi SpecialChar     ctermfg=5       ctermbg=none    cterm=none
hi Tag             ctermfg=none    ctermbg=none    cterm=none
hi Delimiter       ctermfg=none    ctermbg=none    cterm=none
hi SpecialComment  ctermfg=none    ctermbg=none    cterm=none
hi Debug           ctermfg=none    ctermbg=none    cterm=none

" ----------
" - C like -
" ----------
hi PreProc         ctermfg=none    ctermbg=none    cterm=none
hi Include         ctermfg=8       ctermbg=none    cterm=none
hi Define          ctermfg=none    ctermbg=none    cterm=none
hi Macro           ctermfg=8       ctermbg=none    cterm=none
hi PreCondit       ctermfg=none    ctermbg=none    cterm=none

hi Type            ctermfg=3       ctermbg=none    cterm=none
hi StorageClass    ctermfg=1       ctermbg=none    cterm=none
hi Structure       ctermfg=1       ctermbg=none    cterm=none
hi Typedef         ctermfg=1       ctermbg=none    cterm=none

" --------------------------------
" Diff
" --------------------------------
hi DiffAdd         ctermfg=15      ctermbg=2       cterm=none
hi DiffChange      ctermfg=15      ctermbg=3       cterm=none
hi DiffDelete      ctermfg=15      ctermbg=1       cterm=none
hi DiffText        ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Completion menu
" --------------------------------
hi Pmenu           ctermfg=7       ctermbg=9       cterm=none
hi PmenuSel        ctermfg=15      ctermbg=2       cterm=none
hi PmenuSbar       ctermfg=none    ctermbg=8       cterm=none
hi PmenuThumb      ctermfg=none    ctermbg=2       cterm=none

" --------------------------------
" Spelling
" --------------------------------
hi SpellBad        ctermfg=1       ctermbg=none    cterm=underline
hi SpellCap        ctermfg=2       ctermbg=none    cterm=underline
hi SpellLocal      ctermfg=3       ctermbg=none    cterm=underline
hi SpellRare       ctermfg=5       ctermbg=none    cterm=underline

"--------------------------------------------------------------------
" Specific settings                                                 |
"--------------------------------------------------------------------

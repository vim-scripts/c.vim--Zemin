""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Name   : c.vim
" Maintainer  : Brook L.
" Create      : 2014.01.07
" Last Change : 2014.01.30
" License     :	This file is placed in the public domain.
" Description : Extra syntax for C language.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the tags file generated by "ctags" to identify different syntax items.
" "Exuberant ctags" is suggested to use, see "http://ctags.sourceforge.net".
" :help usr_41.txt
" :help eval.txt
" :help :let
" :help :for
" :help :if
" :help :execute
" :help readfile()
" :help matchstr()
" :help strlen()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify the tags file to search syntax items for different project.
" The two global variables "g:WorkPathList" and "g:WorkPathIdx" are defined in 
" "workpath.vim" which is under the path "Vim\vimfiles\plugin\".
let b:TagsFile=g:WorkPathList[g:WorkPathIdx] . '\tags'

for b:KEYWORD_Line in readfile(b:TagsFile)

    " Self-defined type.
    let b:KEYWORD_cType=matchstr(b:KEYWORD_Line, '\_^\zs\<\h\w*\>\ze.\+;"\s\+t')
    if (0 != strlen(b:KEYWORD_cType))
        exe 'syn keyword cType ' . b:KEYWORD_cType
    endif

    " Member of struct, enum, union, etc.
    let b:KEYWORD_cMember=matchstr(b:KEYWORD_Line, '\_^\zs\<\h\w*\>\ze.\+;"\s\+m')
    if (0 != strlen(b:KEYWORD_cMember))
        exe 'syn keyword cMember ' . b:KEYWORD_cMember
    endif

    " Macro define.
    let b:KEYWORD_cDefine=matchstr(b:KEYWORD_Line, '\_^\zs\<\h\w*\>\ze.\+;"\s\+d')
    if (0 != strlen(b:KEYWORD_cDefine))
        exe 'syn keyword cDefine ' . b:KEYWORD_cDefine
    endif

    " Function.
    let b:KEYWORD_cFunction=matchstr(b:KEYWORD_Line, '\_^\zs\<\h\w*\>\ze.\+;"\s\+f')
    if (0 != strlen(b:KEYWORD_cFunction))
        exe 'syn keyword cFunction ' . b:KEYWORD_cFunction
        hi def link cFunction   Function
    endif

    " Global variable.
    let b:KEYWORD_cGlobalVal=matchstr(b:KEYWORD_Line, '\_^\zs\<\h\w*\>\ze.\+;"\s\+v')
    if (0 != strlen(b:KEYWORD_cGlobalVal))
        exe 'syn keyword cGlobalVal ' . b:KEYWORD_cGlobalVal
        hi def link cGlobalVal  cDefine
    endif
endfor

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End of c.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


if !executable('ctags') " && TODO: test for Universal Ctags?
    finish
elseif globpath(&rtp, 'plugin/tagbar.vim') == ""
    finish
elseif exists("b:did_tagbar_elm")
	  finish
endif
let b:did_tagbar_elm = 1

let s:plugin_path = fnamemodify(resolve(expand('<sfile>:p')), ':h:h:h')

function! s:SetTagbar()
" I Want to override the one from elm-vim
"    if !exists(g:tagbar_type_elm)
        let g:tagbar_type_elm = {
            \ 'ctagstype' : 'elm',
            \ 'ctagsargs' : [
                \ '-o-',
                \ '--data-dir=' . s:plugin_path,
                \ '--options=elm'
                \ ],
            \ 'kinds'     : [
                \ 'm:module:0:0',
                \ 'i:import:1:0',
                \ 't:type:0:0',
                \ 'a:type alias:0:0',
                \ 'p:port:0:0',
                \ 'f:function:1:0'
                \ ],
            \ 'sro'      : ':',
            \ 'kind2scope' : {
                \ 'f' : 'function',
                \ 'm' : 'module'
            \ }
        \ }
"    endif
endfunction

call s:SetTagbar()

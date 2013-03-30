filetype on
syntax on

"incremental search
set incsearch

"Enable or disable 'paste' mode with F2
set pastetoggle=<F2>

"try to use the /dev/shm then . for swp files to 
"set directory=/dev/shm,.

"flag tabs as special
"set listchars=tab:>-
"set list!

"Number of spaces that a <tab> in the file count for
set tabstop=3

"Change the GUI font
set gfn=Monospace\ 10

"defaults
set shiftwidth=3 softtabstop=3 expandtab textwidth=80 ruler noic


"mark .mk files as makefile 
augroup filetype
  autocmd BufNewFile,BufRead *.mk set filetype=make
augroup END

"Mark SCons files as python
augroup filetype
  autocmd BufNewFile,BufRead *.sc set filetype=python
augroup END

"XHTML as XML
augroup filetype
  autocmd BufNewFile,BufRead *.xhtml set filetype=xml
augroup END

"For all 'normal' code files use this stuff
autocmd FileType ant,c,cpp,java,perl,xml,xslt,python,xhtml,css,javascript,html,lua,sql set tabstop=3 shiftwidth=3 softtabstop=3 smarttab shiftround expandtab autoindent smartindent textwidth=80 ruler noic
"Scala style dictates 2 spaces instead of 3
autocmd FileType scala,sbt set shiftwidth=2 softtabstop=2 smarttab shiftround expandtab autoindent smartindent textwidth=80 ruler noic
"Go style dictates tabs at shiftwidth 2
autocmd FileType go set noexpandtab tabstop=2 shiftwidth=2 softtabstop=2 smarttab shiftround expandtab autoindent smartindent textwidth=80 ruler noic
"For make files keep tabs etc
autocmd FileType make set noexpandtab shiftwidth=8 nosmarttab softtabstop=0

"Disable fold column
set fdc=0

"Handle Java compiler errors from ant if its a java file
autocmd FileType java set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#

"from Manish's vimrc
set autowrite
set nobackup
set showmatch

"java stuff
let java_highlight_java_lang_ids=1
let java_highlight_all=1
let java_space_errors=1
let java_highlight_functions=1

"c stuff
let c_space_errors = 1

"Highlight lines over 80 chars
autocmd FileType ant,c,cpp,java,perl,python,scala,go highlight OverLength ctermbg=red ctermfg=white guibg=#ffbfbf
autocmd FileType ant,c,cpp,java,perl,python,scala,go match OverLength /\%81v.*/
autocmd FileType ant,c,cpp,java,perl,python,scala set listchars=tab:>-
autocmd FileType ant,c,cpp,java,perl,python,scala set list!



"set tags=./tags,tags

"hilight searches
set hlsearch

" For some reason vim 7.2 broke comment auto indent.  Very odd these 2 fix it
" Still needed?
set formatoptions=croql
set comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-

" Check for .vim.custom in the directory containing the newly opened file
let custom_config_file = expand('%:p:h') . '~/.vimrc_local'
if filereadable(custom_config_file)
   exe 'source' custom_config_file
endif

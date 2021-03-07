if !exists('g:vscode')
	let g:coc_disable_startup_warning = 1
	set nu
	set tabstop=4
	set sw=4
	set autoindent
	set cursorline
	set showcmd
	set wildmenu
	set scrolloff=10
	
	syntax on

	:imap jk <Esc>
	:imap kj <Esc>
	nmap ff :NERDTreeToggle<CR>
	nmap Q :q<CR>

	call plug#begin('~/.config/nvim/plugged')
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'scrooloose/nerdtree'
	call plug#end()

" * start of coc.nvim related settings

	" set coc.nvim syntax highlight coloring
	highlight CocFloating ctermbg=darkgrey
	highlight CocErrorFloat ctermfg=white
	
	" use <tab> for trigger completion and navigate to the next complete item
    function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
	endfunction
    inoremap <silent><expr> <Tab>
		      \ pumvisible() ? "\<C-n>" :
		      \ <SID>check_back_space() ? "\<Tab>" :
		      \ coc#refresh()
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

	" Use K to show documentation in preview window.
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
	" delays and poor user experience.
	set updatetime=300

	" Use K to show documentation in preview window.
	nnoremap <silent> K :call <SID>show_documentation()<CR>
	
	function! s:show_documentation()
	  if (index(['vim','help'], &filetype) >= 0)
	    execute 'h '.expand('<cword>')
	  elseif (coc#rpc#ready())
	    call CocActionAsync('doHover')
	  else
	    execute '!' . &keywordprg . " " . expand('<cword>')
	  endif
	endfunction

	" Highlight the symbol and its references when holding the cursor.
	autocmd CursorHold * silent call CocActionAsync('highlight')

	" GoTo code navigation.
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	" Symbol renaming.
	nmap <leader>rn <Plug>(coc-rename)

	" Show signature help on placeholder jump
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	
" * end of coc.nvim related settings

endif

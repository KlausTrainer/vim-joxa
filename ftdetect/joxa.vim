" Vim file type detection file
" Language:	Joxa
" Maintainer:	Klaus Trainer <klaus_trainer@posteo.de>
" URL:		https://github.com/KlausTrainer/vim-joxa

au BufNewFile,BufRead *.jxa set filetype=joxa
au Filetype joxa setl sw=2 ts=2 et nospell

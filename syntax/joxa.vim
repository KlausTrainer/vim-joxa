" Vim syntax file
" Language:	Joxa
" Maintainer:	Klaus Trainer <klaus_trainer@posteo.de>
" URL:		https://github.com/KlausTrainer/vim-joxa

" remove any old syntax stuff hanging around
syn clear
set iskeyword=33,36,38,42,43,45,46,48-58,60-90,92,95,97-122,_

" Clusters
syn cluster	joxaAtomCluster		contains=joxaAtomList,joxaBinary,joxaString,joxaNumber,joxaEscapedChar
syn cluster	joxaBinaryCluster	contains=joxaBinary,joxaString,joxaNumber,joxaEscapedChar
syn cluster	joxaListCluster		contains=joxaAtom,joxaAtomMark,joxaBinary,joxaBQList,joxaComment,joxaRestArg,joxaConcat,joxaDecl,joxaForm,joxaList,joxaTuple,joxaNumber,joxaSpecial,joxaString,joxaSymbol,joxaEscapedChar

" Lists
syn match	joxaSymbol	contained	/[^()\[\]\{\}<>:\'`,"; \t]\+/
syn region	joxaList	matchgroup=Delimiter start=/[(\[]/ matchgroup=Delimiter end=/[)\]]/ contains=@joxaListCluster
syn region	joxaTuple	matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=@joxaListCluster
syn region	joxaBQList	matchgroup=PreProc   start="`(" matchgroup=PreProc end=")" contains=@joxaListCluster

" Atoms
syn match	joxaAtomMark	/[':]/
syn match	joxaAtom	/'(/me=e-1		contains=joxaAtomMark nextgroup=joxaAtomList
syn match	joxaAtom	/[':][^ \t()\]}]\+/	contains=joxaAtomMark
syn region	joxaAtom	start=/'"/	skip=/\\"/ end=/"/
syn region	joxaAtomList	contained	start=/[(]/ end=/[)]/ contains=@joxaAtomCluster

" Binary
syn region	joxaBinary	contained	matchgroup=Delimiter start=/<</	matchgroup=Delimiter	end=/>>/ contains=@joxaBinaryCluster

" Character
syn match	joxaEscapedChar	/\\\p/hs=s,he=s+1

" Strings
syn region	joxaString	start=/"/ skip=/\\\\\|\\"/ end=/"/

" Numbers
syn match	joxaNumber		"\d\+\(\.\d\+\)\?"		contained

" Special Forms
syn keyword joxaForm	let* try* case when receive do				contained
syn keyword joxaForm	fn apply quote quasiquote				contained
syn keyword joxaForm	cons list string binary tuple				contained
syn keyword joxaForm	macroexpand-1						contained
syn keyword joxaForm	$filename $namespace $line-number $function-name	contained

" Declarations
syn keyword joxaDecl	ns require use				contained
syn keyword joxaDecl	defn+ defn defmacro+ defmacro		contained
syn keyword joxaDecl	defspec+ defspec deftype+ deftype attr	contained

syn keyword joxaRestArg	= &rest			contained

syn match joxaConcat		"\s\.\s"	contained

syn match joxaParenError	")"

" Comments
syn match joxaComment	";.*$"	contains=joxaTodo
syn keyword joxaTodo contained	COMBAK	TODO	Todo
syn keyword joxaTodo contained	COMBAK:	TODO:	Todo:

" synchronization
syn sync fromstart

if !exists("did_joxa_syntax_inits")
  let did_joxa_syntax_inits= 1
  hi link joxaAtomMark		Delimiter
  hi link joxaEscapedChar	Delimiter
  hi link joxaAtom		Boolean
  hi link joxaComment		Comment
  hi link joxaRestArg		Keyword
  hi link joxaConcat		Keyword
  hi link joxaDecl		Define
  hi link joxaForm		Keyword
  hi link joxaNumber		Number
  hi link joxaParenError	Error
  hi link joxaSpecial		Type
  hi link joxaString		String
  hi link joxaTodo		Todo
  endif

let b:current_syntax = "joxa"

" Vim syntax file
" Language: C++
" Maintainer: Ken Shan <ccshan@post.harvard.edu>
" Last Change:  2002 Jul 15

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the C syntax to start with
if version < 600
  so <sfile>:p:h/c.vim
else
  runtime! syntax/c.vim
  unlet b:current_syntax
endif

" C++ extentions
syn keyword cppStatement  new delete this friend using
syn keyword cppAccess   public protected private
syn keyword cppType   inline virtual explicit export bool wchar_t
syn keyword cppExceptions throw try catch
syn keyword cppOperator   operator typeid
syn keyword cppOperator   and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq
syn match cppCast   "\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<"me=e-1
syn match cppCast   "\<\(const\|static\|dynamic\|reinterpret\)_cast\s*$"
syn keyword cppStorageClass mutable
syn keyword cppStructure  class typename template namespace
syn keyword cppNumber   NPOS npos
syn keyword cppBoolean    true false
syn keyword cppSTL    abort abs accumulate acos adjacent_difference adjacent_find adjacent_find_if any append asctime asin assert assign
syn keyword cpp11 nullptr
syn keyword cppStlTypes string vector list deque map iterator

" The minimum and maximum operators in GNU C++
syn match cppMinMax "[<>]?"

" Default highlighting
if version >= 508 || !exists("did_cpp_syntax_inits")
  if version < 508
    let did_cpp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink cppAccess    cppStatement
  HiLink cppCast    cppStatement
  HiLink cppExceptions    Exception
  HiLink cppOperator    Operator
  HiLink cppStatement   Statement
  HiLink cppType    Type
  HiLink cppStlTypes Type
  HiLink cppStorageClass  StorageClass
  HiLink cppStructure   Structure
  HiLink cppNumber    Number
  HiLink cppBoolean   Boolean
  delcommand HiLink
endif

" vim: ts=8
" hl function
syn match cFunctions display "[a-zA-Z_]\{-1,}\s\{-0,}(\{1}"ms=s,me=e-1
hi def link cFunctions Function
syn match cLogicalOperator  display "[!<>]=\="
syn match cbracket   display"[{}()]"
syn match cMathOperator     display "[-+\*%=,;:.\[\]]"
syn match cBinaryOperator   display "\(&\||\|\^\|<<\|>>\)=\="
syn match cLogicalOperator  display "&&\|||"
syn match cLogicalOperatorError display "\(&&\|||\)="
hi def link cLogicalOperator Operator
hi def link cBinaryOperator Operator
hi def link cMathOperator Operator
hi def link cLogicalOperatorError Operator
" hl class name
syn match cClassName "\<[a-zA-Z][a-zA-z_0-9]*\>*\:"me=e-1
hi def link cClassName Type
hi def link cppSTL Identifier
hi def link cpp11 Number

let b:current_syntax = "cpp"
